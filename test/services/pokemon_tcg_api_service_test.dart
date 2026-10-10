import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pokedex_app/services/local/local_service.dart';
import 'package:pokedex_app/services/pokemon_tcg_api_service.dart';

/// PokemonTcgApiService's constructor needs one, but these tests never read
/// or write through it.
class _UnusedLocalService implements LocalService {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('not exercised in these tests');
}

void main() {
  // The service reads dotenv.env unconditionally for the API key header;
  // outside the app's main(), nothing has loaded it.
  setUpAll(() => dotenv.testLoad(fileInput: ''));

  group('PokemonTcgApiService retries transient upstream failures', () {
    // api.pokemontcg.io is observed to return 500/502 for a request, then
    // succeed on an immediate retry of the exact same request - this is
    // upstream flakiness, not a problem with the query or the API key.
    test('a 500 then a 502 then a 200 succeeds without the caller seeing an error',
        () async {
      var calls = 0;
      final client = MockClient((request) async {
        calls++;
        if (calls == 1) return http.Response('server error', 500);
        if (calls == 2) return http.Response('bad gateway', 502);
        return http.Response('{"data": []}', 200);
      });
      final service = PokemonTcgApiService(_UnusedLocalService(),
          client: client, delay: (_) async {});

      final cards = await service.getCardsByNationalDexId(25);

      expect(cards, isEmpty);
      expect(calls, 3);
    });

    test('gives up after exhausting retries and throws, naming the last status',
        () async {
      final client = MockClient((_) async => http.Response('still broken', 500));
      final service = PokemonTcgApiService(_UnusedLocalService(),
          client: client, delay: (_) async {});

      await expectLater(
        service.getCardsByNationalDexId(25),
        throwsA(predicate((e) => e.toString().contains('500'))),
      );
    });

    test('does not retry a non-transient error, such as a bad request', () async {
      var calls = 0;
      final client = MockClient((_) async {
        calls++;
        return http.Response('bad request', 400);
      });
      final service = PokemonTcgApiService(_UnusedLocalService(),
          client: client, delay: (_) async {});

      await expectLater(service.getCardsByNationalDexId(25), throwsException);
      expect(calls, 1, reason: 'a 400 will never succeed on retry, so do not wait');
    });

    test('tolerates a longer failure streak observed against the real API (4 failures then a success)',
        () async {
      var calls = 0;
      final statuses = [500, 502, 500, 500, 200];
      final client = MockClient((_) async {
        final status = statuses[calls];
        calls++;
        return http.Response(status == 200 ? '{"data": []}' : 'error', status);
      });
      final service = PokemonTcgApiService(_UnusedLocalService(),
          client: client, delay: (_) async {});

      final cards = await service.getCardsByNationalDexId(25);

      expect(cards, isEmpty);
      expect(calls, 5);
    });

    test('a 200 on the first attempt needs no retry and no delay', () async {
      var calls = 0;
      final client = MockClient((_) async {
        calls++;
        return http.Response('{"data": []}', 200);
      });
      final service = PokemonTcgApiService(_UnusedLocalService(),
          client: client,
          delay: (_) async => fail('should not delay when the first attempt succeeds'));

      await service.getCardsByNationalDexId(25);

      expect(calls, 1);
    });
  });
}
