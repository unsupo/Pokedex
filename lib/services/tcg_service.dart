import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pokedex_app/models/tcg_card.dart';

import 'local/local_service.dart';

class TcgService {
  final String _baseUrl = 'https://api.pokemontcg.io/v2';
  final String _apiKey = "74e39228-0450-497e-8fc5-f7e23d94f58b";

  final LocalService _localService;

  TcgService(this._localService);

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

  Future<List<TcgCard>> getCardsByNationalDexId(int nationalDexId) async {
    // Use the 'q' parameter for query and 'nationalPokedexNumbers' for the field.
    final url =
        Uri.parse('$_baseUrl/cards?q=nationalPokedexNumbers:$nationalDexId');
    final headers = {
      'Content-Type': 'application/json',
      if (_apiKey.isNotEmpty) 'X-Api-Key': _apiKey,
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<TcgCard> cards = [];
        final List<dynamic> cardList =
            jsonResponse['data']; // Get the list of cards
        for(var cardJson in cardList){
          try {
            cards.add(TcgCard.fromJson(cardJson));
          }catch(e){
            if (kDebugMode) {
              print('Error: ${e.toString()}.');
            }
          }
        }
        return cards;
        // return cardList.map((cardJson) => TcgCard.fromJson(cardJson)).toList();
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
          print('Response body: ${response.body}');
        }
        return []; // Return an empty list on error
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching cards: $e');
      }
      return []; // Return an empty list on error
    }
  }
}
