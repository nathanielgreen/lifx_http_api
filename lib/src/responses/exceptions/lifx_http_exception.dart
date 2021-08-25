class LifxHttpException implements Exception {
  Object errorMessage;
  int statusCode;
  String body;

  LifxHttpException({
    required this.errorMessage,
    required this.statusCode,
    required this.body,
  });
}
