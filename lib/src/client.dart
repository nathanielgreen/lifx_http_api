import 'dart:convert' show jsonDecode;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import './bulb.dart' show Bulb;

@GenerateMocks([Client])
class Client {
  final String apiKey;

  Client(this.apiKey);

  Future<List<Bulb>> listLights() async {
    final url = Uri.parse('https://api.lifx.com/v1/lights/all');
    final Map<String, String> headers = {"Authorization": "Bearer $apiKey"};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      final List<Bulb> bulbs = [];
      data.forEach(
          (Map<String, dynamic> bulb) => bulbs.add(Bulb.fromJson(bulb)));
      return bulbs;
    } else {
      throw Exception('Failed to load bulb');
    }
  }

  Future<num> setState(
    String uuid, {
    String? power,
    double? brightness,
    double? duration,
    double? infrared,
    bool? fast,
  }) async {
    final url = Uri.parse("https://api.lifx.com/v1/lights/$uuid/state");
    final headers = {"Authorization": "Bearer $apiKey"};
    final response = await http.put(url,
        headers: headers, body: {power, brightness, duration, infrared, fast});
    if (response.statusCode == 202) {
      final data = jsonDecode(response.body);
      return data.statusCode as num;
    } else {
      throw Exception('Failed to set bulb state');
    }
  }
}
