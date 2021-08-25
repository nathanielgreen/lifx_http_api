import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;
import 'package:lifx_http_api/src/responses/exceptions/lifx_http_exception.dart';
import './devices/devices.dart';
import './responses/responses.dart';

/// Client to access the LIFX HTTP API.
///
/// LIFX client that takes an [apiKey] to access the LIFX HTTP API endpoints listed at
/// https://api.developer.lifx.com/docs/
class Client {
  final String apiKey;

  Client(this.apiKey);

  /// API call to list all lights by default or [selector].
  Future<Iterable<Bulb>> listLights({String selector = "all"}) async {
    final Uri url = Uri.parse('https://api.lifx.com/v1/lights/$selector');
    final Map<String, String> headers = {"Authorization": "Bearer $apiKey"};
    final http.Response response = await http.get(url, headers: headers);

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

      throw LifxHttpException(
        body: response.body,
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  /// API call to set the state of a light.
  Future<SetStateBody> setState(
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

    // Form body from optional parameters
    final body = {};
    if (power != null) body["power"] = power;
    if (brightness != null) body["brightness"] = brightness;
    if (duration != null) body["duration"] = duration;
    if (infrared != null) body["infrared"] = infrared;
    if (fast != null) body["fast"] = fast;

    final http.Response response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    try {
      // Handle invalid credentials
      if (response.statusCode == 401) {
        throw LifxUnauthorizedError.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      }

      // Handle valid credentials and request
      if (response.statusCode == 207) {
        final Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;

        final SetStateBody body = SetStateBody.fromJson(data);
        return body;
      }

      throw LifxHttpException(
        body: response.body,
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
