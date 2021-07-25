import 'package:json_annotation/json_annotation.dart';
import './color.dart';
import './group.dart';

part 'bulb.g.dart';

@JsonSerializable()
class Bulb {
  final String id;
  final String uuid;
  final String label;
  final bool connected;
  final Group group;
  String power;
  LifxColor color;
  double brightness;

  Bulb({
    required this.id,
    required this.uuid,
    required this.label,
    required this.connected,
    required this.power,
    required this.color,
    required this.brightness,
    required this.group,
  });

  factory Bulb.fromJson(Map<String, dynamic> json) => _$BulbFromJson(json);

  Map<String, dynamic> toJson() => _$BulbToJson(this);
}
