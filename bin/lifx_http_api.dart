import 'package:dotenv/dotenv.dart' show env, load;
import '../lib/lifx_http_api.dart' show Client;

void main() async {
  load();
  final apiKey = env["LIFX_API_KEY"];
  final client = Client("${apiKey}");
  final response = await client.listLights();
}
