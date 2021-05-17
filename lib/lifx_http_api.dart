library lifx_http_api;

import 'package:http/http.dart' as http;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class Client {
  String apiKey;

  Client(this.apiKey);

  Future<http.Response> listLights() async {
    final url = Uri.parse('https://api.lifx.com/v1/lights/all');
    final headers = {"Authorization": "Bearer ${apiKey}"};
    final response = await http.get(url, headers: headers);
    return response;
  }
}
