import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;
import 'package:lifx_http_api/src/responses/exceptions/lifx_http_exception.dart';
import './devices/devices.dart';
import './responses/responses.dart';

/// Client to access the LIFX HTTP API.
///
/// A client that takes an [apiKey] to access the LIFX HTTP API endpoints listed at
/// https://api.developer.lifx.com/docs/
class Client {
  final String apiKey;

  Client(this.apiKey);

  Future<Iterable<Bulb>?> listLights({String selector = "all"}) async {
    final url = Uri.parse('https://api.lifx.com/v1/lights/$selector');
    final Map<String, String> headers = {"Authorization": "Bearer $apiKey"};
    final response = await http.get(url, headers: headers);

    try {
      // Handle invalid credentials
      if (response.statusCode == 401) {
        throw LifxUnauthorizedError.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      }

      // Handle valid credentials and available bulbs
      if (response.statusCode == 200) {
        final data = (jsonDecode(response.body) as List<dynamic>)
            .cast<Map<String, dynamic>>();
        final Iterable<Bulb> bulbs =
            data.map((Map<String, dynamic> bulb) => Bulb.fromJson(bulb));
        return bulbs;
      }
    } catch (e) {
      throw LifxHttpException(
        errorMessage: e,
        statusCode: response.statusCode,
        body: response.body,
      );
    }
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
