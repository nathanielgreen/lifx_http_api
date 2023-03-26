import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late String endpoint;
  late LIFXClient client;
  late http.Client httpClient;

  setUp(() {
    endpoint = 'https://api.lifx.com/v1/lights';
    httpClient = MockClient();
    client = LIFXClient('123', client: httpClient);
  });

  group('LIFXClient', () {
    test('listLights returns List<LIFXBulb>', () async {
      final Selector selector = Selector.id('d073d5141876');
      when(
        () => httpClient.get(
          Uri.parse(
            '$endpoint/${selector.value}',
          ),
          headers: {'Authorization': 'Bearer 123'},
        ),
      ).thenAnswer(
        (_) => Future.value(http.Response('''
    [
      {
        "id": "d073d5141876",
        "uuid": "02a5b510-2d3d-46ea-92ac-c4533f75c24e",
        "label": "Lamp",
        "connected": true,
        "power": "on",
        "color": {
          "hue": 59.997253376058595,
          "saturation": 1,
          "kelvin": 3500
        },
        "brightness": 0.29999237048905164,
        "effect": "OFF",
        "group": {
          "id": "06e3ec50395511e9a0757200055bf1c0",
          "name": "Loungeroom"
        },
        "location": {
          "id": "f2c1aa82395411e9a0757200055bf1c0",
          "name": "Home"
        },
        "product": {
          "name": "Color 1000",
          "identifier": "lifx_color_a19",
          "company": "LIFX",
          "capabilities": {
            "has_color": true,
            "has_variable_color_temp": true,
            "has_ir": false,
            "has_chain": false,
            "has_multizone": false,
            "min_kelvin": 2500,
            "max_kelvin": 9000
          },
          "product_id": 22,
          "vendor_id": 1
        },
        "last_seen": "2019-02-25T23:40:40Z",
        "seconds_since_seen": 0
      }
    ]
    ''', 207)),
      );
      final response = await client.listLights(selector);

      expect(response, isA<List<LIFXBulb>>());
    });

    test('setState returns SetStateResponse', () async {
      final Selector selector = Selector.id('d3b2f2d97452');
      when(
        () => httpClient.put(
          Uri.parse(
            '$endpoint/${selector.value}/state',
          ),
          headers: {
            'Authorization': 'Bearer 123',
            'content-type': 'application/json'
          },
        ),
      ).thenAnswer(
        (_) => Future.value(http.Response('''
        {
          "results": [
            {
              "id": "d3b2f2d97452",
              "label": "Left Lamp",
              "status": "ok"
            }
          ]
        }
            ''', 207)),
      );
      final response = await client.setState(selector);

      expect(response, isA<SetStateResponse>());
    });
  });
}
