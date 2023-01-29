import 'dart:convert';

typedef Parse<T> = T Function(Map entry);

// contains helper methods to parse json data based on coin cap api response
class TransformerUtils {
  static const String dataField = "data";

  static List<T> fromJson<T>(String json, Parse<T> parse) {
    var decodedJson = jsonDecode(json);
    var listOfPrices = decodedJson[dataField];

    return List.from(listOfPrices).map((e) => parse(e)).toList();
  }
}
