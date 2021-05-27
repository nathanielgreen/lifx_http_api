import 'package:test/test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' show Response;
import '../lib/lifx_http_api.dart' show Client;

void main() {
  group('Client', () {
    test('can set the API key', () {
      final client = Client("123");
      expect(client.apiKey, "123");
    });
  });
}
