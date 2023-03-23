import 'package:http/http.dart' as http;
import 'package:lifx_http_api/client.dart';

LIFXResponse handleResponse(http.Response response) {
  if (response.statusCode.toString().startsWith('2')) {
    return LIFXResponse(response.body, response.statusCode);
  }
  if (response.statusCode == 401) {
    throw LIFXUnauthorizedError(response: response);
  }
  throw LIFXUnknownError(response: response);
}
