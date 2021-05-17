import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:lifx_dart/lifx_dart.dart';

var httpClient = MockClient((request) async {
  return Response("", 404);
});

void main() {
  group('Client', () {
    test('can set the API key', () {
      final client = Client("123");
      expect(client.apiKey, "123");
    });
    test('can fetch all lights', () {
      final client = Client("123");
      expect(client.listLights, Response("", 200));
    });
  });
}
