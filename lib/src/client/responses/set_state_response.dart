import 'dart:convert' show jsonDecode;
import 'package:json_annotation/json_annotation.dart';
import 'package:lifx_http_api/client.dart';

part 'set_state_response.g.dart';

class SetStateResponse extends LIFXResponse {
  final SetStateBody? data;

  SetStateResponse(
    super.body,
    super.statusCode,
  ) : data = body.isEmpty ? null : SetStateBody.fromJson(jsonDecode(body));
}

@JsonSerializable()
class SetStateBody {
  List<SetStateResult> results;

  SetStateBody({
    required this.results,
  });

  factory SetStateBody.fromJson(Map<String, dynamic> json) =>
      _$SetStateBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SetStateBodyToJson(this);
}

@JsonSerializable()
class SetStateResult {
  final String id;
  final String label;
  final String status;

  SetStateResult({
    required this.id,
    required this.label,
    required this.status,
  });

  factory SetStateResult.fromJson(Map<String, dynamic> json) =>
      _$SetStateResultFromJson(json);

  Map<String, dynamic> toJson() => _$SetStateResultToJson(this);
}
