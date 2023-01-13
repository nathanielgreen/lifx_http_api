// ignore_for_file: avoid_print, avoid_void_async
import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:lifx_http_api/cli.dart';
import 'package:cli_repl/cli_repl.dart';
import 'package:dotenv/dotenv.dart';

void main() async {
  final Repl repl = Repl(prompt: '[lifx] >>> ', continuation: '... ');
  final DotEnv env = DotEnv(includePlatformEnvironment: true)..load();
  final String? apiKey = env['LIFX_API_KEY'];

  if (apiKey == null) {
    throw "No LIFX API Key found. Please add one to the .env";
  } else {
    print("API Key found: $apiKey");
  }

  final LIFXClient client = LIFXClient(apiKey);
  final LIFXCli cli = LIFXCli(client: client);

  help();

  await for (final x in repl.runAsync()) {
    if (x.trim().isEmpty) {
      continue;
    } else if (x == 'lights') {
      cli.getLights();
    } else if (x == 'help') {
      help();
    } else if (x.split(" ")[0] == 'power') {
      final List<String> args = x.split(" ");
      final String id = args[1];
      final String power = args[2];
      cli.changePower(id, power);
    } else if (x.split(" ")[0] == 'brightness') {
      final List<String> args = x.split(" ");
      final String id = args[1];
      final String brightness = args[2];
      cli.changeBrightness(id, brightness);
    } else if (x.split(" ")[0] == 'kelvin') {
      final List<String> args = x.split(" ");
      final String id = args[1];
      final String kelvin = args[2];
      cli.changeKelvin(id, int.parse(kelvin));
    } else {
      print("Command not found.");
    }
  }
}

void help() {
  print('''

    LIFX HTTP API Command line interface.

    Commands:

    help                      show this prompt.
    lights                    prints all available lights for your API key.
    power <id> on|off         powers a light on or off.
    brightness <id> 0.0-1.0   changes the brightness of a bulb.
    kelvin <id> 1500-6000     changes the kelvin color temp of a bulb.
''');
  print('');
}
