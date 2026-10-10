import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex_app/models/tcg_card.dart';

import 'local/local_service.dart';
import 'tcg_service.dart';

/// The only production [TcgService]: fetches from api.pokemontcg.io.
///
/// api.pokemontcg.io is observed to intermittently return 500/502 for a
/// request that succeeds on an immediate retry of the exact same request -
/// upstream flakiness, not a problem with the query, the key, or rate
/// limiting (an unrelated id can fail right after a successful one, and the
/// same id can succeed right after failing). [getCardsByNationalDexId]
/// retries a handful of times on those statuses before giving up.
class PokemonTcgApiService implements TcgService {
  final String _baseUrl = 'https://api.pokemontcg.io/v2';
  // Read from .env (see .env.example) rather than hardcoded, so the real key
  // isn't committed to source control. The API works unauthenticated too,
  // just at a lower rate limit - see the pattern below of only sending the
  // header when a key is actually configured.
  String get _apiKey => dotenv.env['POKEMON_TCG_API_KEY'] ?? '';

  // ignore: unused_field
  final LocalService _localService;
  final http.Client _client;
  final Future<void> Function(Duration) _delay;

  static const _retryableStatuses = {500, 502, 503, 504};
  // api.pokemontcg.io has been observed to fail 500/502 up to 4 times in a
  // row before succeeding (see docs/tickets/tcg-api-upstream-flakiness.md),
  // so 3 attempts wasn't always enough. Failures return fast (under half a
  // second each), so 5 attempts with a capped backoff stays well under the
  // latency of one slow successful request.
  static const _maxAttempts = 5;
  static const _maxDelay = Duration(milliseconds: 1500);

  PokemonTcgApiService(
    this._localService, {
    http.Client? client,
    Future<void> Function(Duration)? delay,
  })  : _client = client ?? http.Client(),
        _delay = delay ?? Future<void>.delayed;

  /// Retries [_retryableStatuses] up to [_maxAttempts] times, with a short
  /// backoff between attempts. Any other status (success or a genuine client
  /// error) returns immediately on the first attempt.
  Future<http.Response> _getWithRetry(Uri url, Map<String, String> headers) async {
    late http.Response response;
    for (var attempt = 1; attempt <= _maxAttempts; attempt++) {
      response = await _client.get(url, headers: headers);
      if (!_retryableStatuses.contains(response.statusCode)) {
        return response;
      }
      if (attempt < _maxAttempts) {
        if (kDebugMode) {
          print('TCG API returned ${response.statusCode} for $url, '
              'retrying ($attempt/$_maxAttempts)...');
        }
        final backoff = Duration(milliseconds: 300 * attempt);
        await _delay(backoff > _maxDelay ? _maxDelay : backoff);
      }
    }
    return response;
  }

  @override
  Future<TcgCard?> getCard(String cardId) async {
    final url = Uri.parse('$_baseUrl/cards/$cardId');
    final headers = {
      'Content-Type': 'application/json',
      if (_apiKey.isNotEmpty) 'X-Api-Key': _apiKey, // Add API key if provided
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
          print('Response body: ${response.body}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching card: $e');
      }
      return null;
    }
  }

  @override
  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async {
    // Use the 'q' parameter for query and 'nationalPokedexNumbers' for the field.
    final url =
        Uri.parse('$_baseUrl/cards?q=nationalPokedexNumbers:$nationalDexId');
    final headers = {
      'Content-Type': 'application/json',
      if (_apiKey.isNotEmpty) 'X-Api-Key': _apiKey,
    };

    final response = await _getWithRetry(url, headers);

    if (response.statusCode != 200) {
      // Previously this swallowed every failure (bad API key, rate limit,
      // upstream outage, ...) into a silent empty list, so the TCG tab just
      // showed no cards with no indication anything had gone wrong. Throwing
      // here lets TcgApiProvider.getPokemonCards()'s existing try/catch set
      // a real error message, which main.dart now surfaces as a SnackBar.
      throw Exception(
          'TCG API request failed with status ${response.statusCode}: ${response.body}');
    }

    final jsonResponse = jsonDecode(response.body);
    final List<TcgCard> cards = [];
    final List<dynamic> cardList =
        jsonResponse['data']; // Get the list of cards
    for (var cardJson in cardList) {
      try {
        cards.add(TcgCard.fromJson(cardJson));
      } catch (e) {
        if (kDebugMode) {
          print('Error parsing TCG card: ${e.toString()}.');
        }
      }
    }
    return cards;
  }
}
