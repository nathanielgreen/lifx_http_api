import 'package:json_annotation/json_annotation.dart';

part 'lifx_group.g.dart';

@JsonSerializable()
class LIFXGroup {
  final String id;
  final String name;

  LIFXGroup({
    required this.id,
    required this.name,
  });

  factory LIFXGroup.fromJson(Map<String, dynamic> json) =>
      _$LIFXGroupFromJson(json);

  Map<String, dynamic> toJson() => _$LIFXGroupToJson(this);
}
