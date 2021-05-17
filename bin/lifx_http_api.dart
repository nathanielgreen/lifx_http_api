import 'package:dotenv/dotenv.dart' show env, load;
import '../lib/lifx_http_api.dart' show Client;

void main() async {
  load();
  var apiKey = env["LIFX_API_KEY"];
  var client = Client("${apiKey}");
  var response = await client.listLights();
}
