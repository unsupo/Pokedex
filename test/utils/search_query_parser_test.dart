import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/utils/search_query_parser.dart';

void main() {
  group('parseSearchQuery', () {
    test('plain text with no stage: token is all fuzzy term, no stages', () {
      final result = parseSearchQuery('flamethrower');
      expect(result.fuzzyTerm, 'flamethrower');
      expect(result.stages, isEmpty);
    });

    test('lowercases plain-text tokens', () {
      final result = parseSearchQuery('Fire FLAMETHROWER');
      expect(result.fuzzyTerm, 'fire flamethrower');
    });

    test('empty input yields an empty fuzzy term and no stages', () {
      final result = parseSearchQuery('');
      expect(result.fuzzyTerm, '');
      expect(result.stages, isEmpty);
    });

    test('whitespace-only input yields an empty fuzzy term', () {
      final result = parseSearchQuery('   ');
      expect(result.fuzzyTerm, '');
      expect(result.stages, isEmpty);
    });

    test('a single stage: token is extracted, leaving no plain text', () {
      final result = parseSearchQuery('stage:1');
      expect(result.fuzzyTerm, '');
      expect(result.stages, [1]);
    });

    test('a stage: token alongside plain text extracts both', () {
      final result = parseSearchQuery('fire stage:2');
      expect(result.fuzzyTerm, 'fire');
      expect(result.stages, [2]);
    });

    test('a comma-separated stage: token yields multiple stages', () {
      final result = parseSearchQuery('stage:1,2');
      expect(result.stages, [1, 2]);
    });

    test('repeating the stage: key collects both stages (OR)', () {
      final result = parseSearchQuery('stage:1 stage:2');
      expect(result.stages, [1, 2]);
    });

    test('stage: key matching is case-insensitive', () {
      final result = parseSearchQuery('STAGE:3');
      expect(result.stages, [3]);
      expect(result.fuzzyTerm, '');
    });

    test('an unrecognized key:value-shaped token is kept as plain text', () {
      final result = parseSearchQuery('foo:bar');
      expect(result.fuzzyTerm, 'foo:bar');
      expect(result.stages, isEmpty);
    });

    test('multiple space-separated plain-text words are all kept, joined by a single space', () {
      final result = parseSearchQuery('fire  flamethrower');
      expect(result.fuzzyTerm, 'fire flamethrower');
    });

    test('a malformed stage: token (non-numeric value) degrades to plain text', () {
      final result = parseSearchQuery('stage:abc');
      expect(result.fuzzyTerm, 'stage:abc');
      expect(result.stages, isEmpty);
    });
  });
}
