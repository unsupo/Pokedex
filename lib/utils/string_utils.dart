String capitalizeFirstLetter(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
String sanitizeName(String text) {
  if (text.isEmpty) {
    return text;
  }
  // Only strip known gender-suffix patterns (e.g. "nidoran-f"/"nidoran-m").
  // Do NOT blindly split on '-' as many Pokémon names are legitimately
  // hyphenated (e.g. "ho-oh", "porygon-z", "jangmo-o", "type-null").
  if (text.endsWith('-f')) {
    return '${text.substring(0, text.length - 2)}♀';
  }
  if (text.endsWith('-m')) {
    return '${text.substring(0, text.length - 2)}♂';
  }
  return text;
}