import 'package:http/http.dart' as http;
import 'package:lifx_http_api/client.dart';

LIFXResponse handleResponse(http.Response response, int successStatusCode) {
  if (response.statusCode == successStatusCode) {
    return LIFXResponse(response.body, response.statusCode);
  }
  if (response.statusCode == 401) {
    throw LIFXUnauthorizedError();
  }
  throw LIFXUnknownError();
}
