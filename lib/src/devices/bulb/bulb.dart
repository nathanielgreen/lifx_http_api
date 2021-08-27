import 'package:json_annotation/json_annotation.dart';
import '../../properties/properties.dart';

part 'bulb.g.dart';

/// An instance of a LIFX Bulb.
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

  Bulb copyWith({
    String? id,
    String? uuid,
    String? label,
    bool? connected,
    LifxGroup? group,
    LifxPower? power,
    LifxColor? color,
    double? brightness,
  }) {
    return Bulb(
      id: id ?? this.id,
      uuid: uuid ?? this.id,
      label: label ?? this.label,
      connected: connected ?? this.connected,
      group: group ?? this.group,
      power: power ?? this.power,
      color: color ?? this.color,
      brightness: brightness ?? this.brightness,
    );
  }
}
