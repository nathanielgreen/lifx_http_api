import 'package:http/http.dart' as http;

abstract class LIFXError {
  http.Response? response;

  LIFXError({
    this.response,
  });
}
