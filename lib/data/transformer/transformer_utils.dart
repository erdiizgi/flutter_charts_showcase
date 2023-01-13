import 'dart:convert';

typedef Parse<T> = T Function(Map entry);

class TransformerUtils {
  static List<T> fromJson<T>(String json, Parse<T> parse) {
    var decodedJson = jsonDecode(json);
    var listOfPrices = decodedJson["data"];

    return List.from(listOfPrices).map((e) => parse(e)).toList();
  }
}
