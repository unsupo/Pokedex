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
  return text.split('-')[0];
}