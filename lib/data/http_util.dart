import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HttpUtil {
  static Future<String> httpGet(String url) async {
    var response = await get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception("API error");
    }

    if (kDebugMode) {
      print("Retrieved Response: ${response.body}");
    }
    return response.body;
  }

  HttpUtil._();
}
