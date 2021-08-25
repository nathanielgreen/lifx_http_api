import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';



@JsonSerializable()
class LifxGroup {
  final String id;
  final String name;

  LifxGroup({
    required this.id,
    required this.name,
  });

  factory LifxGroup.fromJson(Map<String, dynamic> json) =>
      _$LifxGroupFromJson(json);

  Map<String, dynamic> toJson() => _$LifxGroupToJson(this);
}
