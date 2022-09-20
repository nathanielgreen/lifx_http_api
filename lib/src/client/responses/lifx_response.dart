import 'package:http/http.dart' as http;

class LIFXResponse extends http.Response {
  LIFXResponse(super.body, super.statusCode);
}
