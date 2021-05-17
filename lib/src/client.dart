import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;
import './bulb.dart' show Bulb;

class Client {
  String apiKey;

  Client(this.apiKey);

  Future<List<Bulb>> listLights() async {
    final url = Uri.parse('https://api.lifx.com/v1/lights/all');
    final headers = {"Authorization": "Bearer ${apiKey}"};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Bulb> bulbs = [];
      data.forEach((bulb) => bulbs.add(Bulb.fromJson(bulb)));
      return bulbs;
    } else {
      throw Exception('Failed to load bulb');
    }
  }

  Future<String> setState(String uuid) async {
    final url = Uri.parse("https://api.lifx.com/v1/lights/$uuid/state");
    final headers = {"Authorization": "Bearer ${apiKey}"};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 202) {
      final data = jsonDecode(response.body);
      return data.status;
    } else {
      throw Exception('Failed to set bulb state');
    }
  }
}
