// ignore_for_file: avoid_print, avoid_void_async
import 'package:lifx_http_api/lifx_http_api.dart' show Client, Bulb;
import 'package:cli_repl/cli_repl.dart';
import 'package:dotenv/dotenv.dart' show load, env;

void main() async {
  load();

  final repl = Repl(prompt: '[lifx] >>> ', continuation: '... ');

  final client = loadApiKey(repl);

  await for (final x in repl.runAsync()) {
    if (x.trim().isEmpty) {
      continue;
    } else if (x == 'lights') {
      getLights(client);
    } else if (x == 'help') {
      help();
    } else if (x.split(" ")[0] == 'power') {
      final List<String> args = x.split(" ");
      final String id = args[1];
      final String pow = args[2];
      power(client, id, pow);
    } else {
      print("Command not found.");
    }
  }
}

void help() {
  print('''

    LIFX HTTP API Command line interface.

    Commands:

    lights                   prints all available lights for your API key.
    power <id> on|off        powers a light on or off.
''');
  print('');
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

void getLights(Client client) async {
  final lights = await client.listLights();
  for (final Bulb light in lights) {
    print('''
        ID: ${light.id}
        Label: ${light.label}
        ---
    ''');
  }
}

void power(Client client, String uuid, String power) async {
  final res = await client.setState(uuid, power: power);
  print(res);
}
