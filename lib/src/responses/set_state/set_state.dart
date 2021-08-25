import 'package:json_annotation/json_annotation.dart';

part 'set_state.g.dart';

@JsonSerializable()
class SetStateBody {
  List<SetStateResults> results;

  SetStateBody({
    required this.results,
  });

  factory SetStateBody.fromJson(Map<String, dynamic> json) =>
      _$SetStateBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SetStateBodyToJson(this);
}

@JsonSerializable()
class SetStateResults {
  final String id;
  final String label;
  final String status;

  SetStateResults({
    required this.id,
    required this.label,
    required this.status,
  });

  factory SetStateResults.fromJson(Map<String, dynamic> json) =>
      _$SetStateResultsFromJson(json);

  Map<String, dynamic> toJson() => _$SetStateResultsToJson(this);
}
