import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;
import './bulb.dart' show Bulb;

/// Client to access the LIFX HTTP API.
///
/// A client that takes an [apiKey] to access the LIFX HTTP API endpoints listed at
/// https://api.developer.lifx.com/docs/
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

  Future<Map<String, dynamic>> setState(
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
    final body = {};
    if (power != null) body["power"] = power;
    if (brightness != null) body["brightness"] = brightness;
    if (duration != null) body["duration"] = duration;
    if (infrared != null) body["infrared"] = infrared;
    if (fast != null) body["fast"] = fast;

    final http.Response response =
        await http.put(url, headers: headers, body: jsonEncode(body));
    final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 207) {
      return data;
    } else {
      throw Exception('Failed to set bulb state');
    }
  }
}
