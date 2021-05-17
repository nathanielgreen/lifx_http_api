import 'dart:io';
import 'package:dotenv/dotenv.dart' show env, load;
import '../lib/lifx_http_api.dart' show Client;

void main() async {
  load();
  var api_key = env["LIFX_API_KEY"];
  var client = Client("${api_key}");
  var response = await client.listLights();
  await print(response.statusCode);
  await print(response.body);
}
