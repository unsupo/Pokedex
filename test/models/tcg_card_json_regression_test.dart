import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:pokedex_app/models/tcg_card.dart';

// Regression test for docs/features/tcg-card-json-parsing-regression.md.
//
// Making TcgCard.isarId non-nullable (to fix its Isar upsert footgun - see
// the "Data model changes" section of docs/features/card-binder.md) silently
// changed json_serializable's generated fromJson to a hard
// `(json['isarId'] as num).toInt()` cast. The real PokemonTCG API response
// never has an "isarId" key (it's a local Isar primary key, not part of that
// API's shape), so every real fetch threw `type 'Null' is not a subtype of
// type 'num'` - confirmed live via adb logcat against api.pokemontcg.io.
// Fixed by excluding isarId from the JSON codec entirely
// (@JsonKey(includeFromJson: false, includeToJson: false)), matching how
// the pre-existing isCaught field is already excluded.
void main() {
  group('TcgCard.fromJson (regression: isarId must not break real API parsing)', () {
    test('AC1: fromJson does not throw when the response has no isarId key (the real API\'s shape)', () {
      // Minimal shape, deliberately missing "isarId" - exactly what
      // api.pokemontcg.io actually returns (it has no concept of this
      // app's local Isar primary key).
      final json = <String, dynamic>{
        'id': 'base1-1',
        'name': 'Alakazam',
        'supertype': 'Pokémon',
        'nationalPokedexNumbers': [65],
      };

      TcgCard? card;
      expect(() => card = TcgCard.fromJson(json), returnsNormally);
      expect(card!.id, 'base1-1');
      expect(card!.name, 'Alakazam');
      // isarId must come from Isar's own autoIncrement, never from JSON -
      // it should keep its default rather than being forced by the (absent)
      // JSON key.
      expect(card!.isarId, Isar.autoIncrement);
    });

    test('AC1: a full realistic card fixture round-trips through fromJson without error', () {
      // Shaped like a real multi-card API response entry (trimmed, but with
      // the nested objects populated) - the scenario that was failing for
      // every one of the 22 cards fetched live for Ivysaur this session.
      final json = <String, dynamic>{
        'id': 'swsh1-1',
        'name': 'Celebi V',
        'supertype': 'Pokémon',
        'subtypes': ['Basic', 'V'],
        'types': ['Grass'],
        'rarity': 'Rare Holo V',
        'number': '1',
        'nationalPokedexNumbers': [251],
        'images': {
          'small': 'https://images.pokemontcg.io/swsh1/1.png',
          'large': 'https://images.pokemontcg.io/swsh1/1_hires.png',
        },
        'set': {
          'id': 'swsh1',
          'name': 'Sword & Shield',
          'series': 'Sword & Shield',
        },
      };

      TcgCard? card;
      expect(() => card = TcgCard.fromJson(json), returnsNormally);
      expect(card!.images?.small, 'https://images.pokemontcg.io/swsh1/1.png');
      expect(card!.set?.name, 'Sword & Shield');
      expect(card!.nationalPokedexNumbers, [251]);
    });

    test('isarId is excluded from toJson too, not just fromJson', () {
      final card = TcgCard(id: 'base1-1', name: 'Alakazam');
      final json = card.toJson();
      expect(json.containsKey('isarId'), isFalse);
    });
  });
}
