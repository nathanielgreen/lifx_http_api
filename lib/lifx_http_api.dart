library lifx_dart;

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
    print(headers);
    final response = await http.get(url, headers: headers);
    return response;
  }
}

class Bulb {
  final String id;
  final String uuid;
  final String label;
  final bool connected;
  String power;

  Bulb({
    this.id,
    this.uuid,
    this.label,
    this.connected,
    this.power,
  });
}
