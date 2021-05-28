// ignore_for_file: avoid_print, avoid_void_async
import 'package:lifx_http_api/lifx_http_api.dart' show Client, Bulb;
import 'package:cli_repl/cli_repl.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() async {
  load();

  final repl = Repl(prompt: '[lifx] >>> ', continuation: '... ');

  final client = loadApiKey(repl);

  await for (final x in repl.runAsync()) {
    switch (x) {
      case '':
        continue;
      case 'lights':
        final res = await getLights(client);
        print(res);
        break;
      case 'help':
        help();
        break;
      default:
        print(x);
    }
  }
}

void help() {
  print('''

    LIFX HTTP API Command line interface.

    Commands:

    lights   prints all available lights for your API key.

      ''');
}

Client loadApiKey(Repl repl) {
  final apiKey = env['LIFX_API_KEY'];
  if (apiKey == null) {
    throw "No LIFX API Key found. Please add one to the .env";
  } else {
    print("API Key found: $apiKey");
  }
  return Client(apiKey);
}

Future<List<Bulb>> getLights(Client client) async {
  final lights = await client.listLights();
  return lights;
}
