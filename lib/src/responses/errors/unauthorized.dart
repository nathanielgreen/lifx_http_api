import 'package:json_annotation/json_annotation.dart';

part 'unauthorized.g.dart';

/// The unauthorized error returned from LIFX HTTP API.
///
/// The 401 unauthorized error object that's returned from LIFX HTTP API when
/// invalid credentials are passed.
@JsonSerializable()
class LifxUnauthorizedError {
  final String error;

  LifxUnauthorizedError({required this.error});

  factory LifxUnauthorizedError.fromJson(Map<String, dynamic> json) =>
      _$LifxUnauthorizedErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LifxUnauthorizedErrorToJson(this);
}
