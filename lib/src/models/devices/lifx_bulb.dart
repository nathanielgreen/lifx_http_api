import 'package:json_annotation/json_annotation.dart';
import 'package:lifx_http_api/models.dart';

part 'lifx_bulb.g.dart';

/// An instance of a LIFX Bulb.
@JsonSerializable()
class LIFXBulb {
  final String id;
  final String uuid;
  final String label;
  final bool connected;
  final LIFXGroup group;
  final LIFXPower power;
  final LIFXColor color;
  final double brightness;

  LIFXBulb({
    required this.id,
    required this.uuid,
    required this.label,
    required this.connected,
    required this.power,
    required this.color,
    required this.brightness,
    required this.group,
  });

  factory LIFXBulb.fromJson(Map<String, dynamic> json) =>
      _$LIFXBulbFromJson(json);

  Map<String, dynamic> toJson() => _$LIFXBulbToJson(this);

  LIFXBulb copyWith({
    String? id,
    String? uuid,
    String? label,
    bool? connected,
    LIFXGroup? group,
    LIFXPower? power,
    LIFXColor? color,
    double? brightness,
  }) {
    return LIFXBulb(
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
