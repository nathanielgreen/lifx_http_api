import 'package:json_annotation/json_annotation.dart';
import '../../properties/properties.dart';

part 'bulb.g.dart';

@JsonSerializable()
class Bulb {
  final String id;
  final String uuid;
  final String label;
  final bool connected;
  final LifxGroup group;
  final LifxPower power;
  final LifxColor color;
  final double brightness;

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
