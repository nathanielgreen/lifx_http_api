import 'dart:convert' show jsonDecode, jsonEncode;
import 'package:http/http.dart' as http;
import 'package:lifx_http_api/models.dart';
import 'package:lifx_http_api/client.dart';
import 'package:lifx_http_api/logging.dart';

/// Client to access the LIFX HTTP API.
///
/// LIFX client that takes an [apiKey] to access the LIFX HTTP API endpoints listed at
/// https://api.developer.lifx.com/docs/
class LIFXClient {
  final String apiKey;

  /// API Endpoint for the LIFX HTTP API
  final String endpoint;

  LIFXClient(
    this.apiKey, {
    this.endpoint = 'https://api.lifx.com/v1/lights',
  });

  /// API call to list all lights by default or [selector].
  Future<List<LIFXBulb>> listLights(Selector selector) async {
    final Uri url = Uri.parse('$endpoint/${selector.value}');
    final Map<String, String> headers = {"Authorization": "Bearer $apiKey"};

    try {
      final http.Response response = await http.get(url, headers: headers);
      final LIFXResponse handledRes = handleResponse(response);
      final List<Map<String, dynamic>> body =
          List<Map<String, dynamic>>.from(jsonDecode(handledRes.body));
      final List<LIFXBulb> bulbs = body
          .map((Map<String, dynamic> bulb) => LIFXBulb.fromJson(bulb))
          .toList();
      return bulbs;
    } catch (e, s) {
      Logging.error(e, s);
      rethrow;
    }
  }

  // /// API call to set the state of a light.
  Future<SetStateResponse> setState(
    Selector selector, {
    String? power,
    double? brightness,
    double? duration,
    double? infrared,
    bool? fast,
    LIFXColor? color,
  }) async {
    final Uri url =
        Uri.parse("https://api.lifx.com/v1/lights/${selector.value}/state");
    final Map<String, String> headers = {
      "Authorization": "Bearer $apiKey",
      "content-type": "application/json"
    };

    // Form body from optional parameters
    final Map<String, dynamic> body = {};
    if (power != null) body["power"] = power;
    if (brightness != null) body["brightness"] = brightness;
    if (duration != null) body["duration"] = duration;
    if (infrared != null) body["infrared"] = infrared;
    if (fast != null) body["fast"] = fast;
    if (color != null) body["color"] = color;

    try {
      final http.Response response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      final LIFXResponse handledRes = handleResponse(response);
      final SetStateResponse result =
          SetStateResponse(handledRes.body, handledRes.statusCode);
      return result;
    } catch (e, s) {
      Logging.error(e, s);
      rethrow;
    }
  }
}
