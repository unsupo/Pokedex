/// The result of splitting a Pokedex search-bar query into free text and
/// `stage:` modifiers. See docs/features/search-fuzzy-and-stage.md.
class ParsedSearchQuery {
  /// The plain-text tokens, lowercased and re-joined with single spaces.
  /// Empty when the query had no plain text (e.g. just a `stage:` token).
  final String fuzzyTerm;

  /// Evolution stages requested via `stage:` tokens (`stage:1`, the
  /// comma-separated `stage:1,2`, or the repeated-key `stage:1 stage:2`),
  /// in the order first seen. Empty when no `stage:` token was typed.
  final List<int> stages;

  const ParsedSearchQuery({required this.fuzzyTerm, required this.stages});
}

final RegExp _whitespace = RegExp(r'\s+');
final RegExp _stagePrefix = RegExp(r'^stage:', caseSensitive: false);

/// Splits [input] into free text and `stage:` modifiers.
///
/// Only the literal `stage:` key is treated as a modifier. Any other
/// `key:value`-shaped token (e.g. `foo:bar`), and any `stage:` token whose
/// value doesn't parse as comma-separated integers, is folded back into the
/// plain text and fuzzy-matched like any other word - never dropped, never
/// an error.
ParsedSearchQuery parseSearchQuery(String input) {
  final plainTokens = <String>[];
  final stages = <int>[];

  for (final token in input.split(_whitespace)) {
    if (token.isEmpty) continue;

    if (_stagePrefix.hasMatch(token)) {
      final value = token.substring(token.indexOf(':') + 1);
      final parsedStages = value.split(',').map(int.tryParse).toList();
      if (parsedStages.isNotEmpty && parsedStages.every((n) => n != null)) {
        stages.addAll(parsedStages.cast<int>());
        continue;
      }
    }

    plainTokens.add(token.toLowerCase());
  }

  return ParsedSearchQuery(fuzzyTerm: plainTokens.join(' '), stages: stages);
}
