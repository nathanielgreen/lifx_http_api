class LifxHttpException implements Exception {
  int statusCode;
  String body;

  LifxHttpException({
    required this.statusCode,
    required this.body,
  });
}
