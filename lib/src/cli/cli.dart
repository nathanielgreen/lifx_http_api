import 'package:lifx_http_api/lifx_http_api.dart';

class LIFXCli {
  final LIFXClient client;

  LIFXCli({
    required this.client,
  });

  void getLights() async {
    final List<LIFXBulb> bulbs = await client.listLights(Selector());
    for (var bulb in bulbs) {
      print('Light: ${bulb.label}');
      print('ID: ${bulb.id}');
      print('Power: ${bulb.power}');
      print('brightness: ${bulb.brightness}');
      print('Hue: ${bulb.color.hue}');
      print('Kelvin: ${bulb.color.kelvin}');
      print('Saturation: ${bulb.color.saturation}');
      print('---');
    }
  }

  Future<void> changePower(String id, String power) async {
    final res = await client.setState(
      Selector.id(id),
      power: power,
    );
    print(res);
  }

  Future<void> changeBrightness(String id, String brightness) async {
    final res = await client.setState(
      Selector.id(id),
      brightness: double.parse(brightness),
    );
    print(res);
  }

  Future<void> changeKelvin(String id, int kelvin) async {
    final res = await client.setState(
      Selector.id(id),
      color: LIFXColor(kelvin: kelvin),
    );
    print(res);
  }
}
