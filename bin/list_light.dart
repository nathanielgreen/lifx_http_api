import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

void main() async {
  load();
  String? key = env["LIFX_API_KEY"];
  Client client = Client(key != null ? key : '');
  List<Bulb> res = await client.listLights();
  print(res);
  clean();
}
