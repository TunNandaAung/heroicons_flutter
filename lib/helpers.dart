String toCamelCase(String input) {
  final splitted = input.split(RegExp(r"[\s\-\_\.]"));

  String result =
      splitted[0].substring(0, 1).toLowerCase() + splitted[0].substring(1);

  for (var i = 1; i < splitted.length; i++) {
    result += splitted[i].substring(0, 1).toUpperCase() +
        splitted[i].substring(1).toLowerCase();
  }

  return result;
}
