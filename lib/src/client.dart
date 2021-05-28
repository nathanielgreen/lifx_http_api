import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;
import './bulb.dart' show Bulb;

class Client {
  final String apiKey;

  Client(this.apiKey);

  Future<Iterable<Bulb>> listLights() async {
    final url = Uri.parse('https://api.lifx.com/v1/lights/all');
    final Map<String, String> headers = {"Authorization": "Bearer $apiKey"};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data =
          (jsonDecode(response.body) as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final Iterable<Bulb> bulbs = data.map((bulb) => Bulb.fromJson(bulb));
      return bulbs;
    }
    throw Exception('Failed to load bulb');
  }

  Future<num> setState(
    String id, {
    String? power,
    double? brightness,
    double? duration,
    double? infrared,
    bool? fast,
  }) async {
    final url = Uri.parse("https://api.lifx.com/v1/lights/$id/state");
    final headers = {
      "Authorization": "Bearer $apiKey",
      "content-type": "application/json"
    };
    final body = jsonEncode({"power": power, "fast": false});
    print(body);
    final response = await http.put(url, headers: headers, body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 202) {
      final data = jsonDecode(response.body);
      return data.statusCode as num;
    } else {
      throw Exception('Failed to set bulb state');
    }
  }
}
