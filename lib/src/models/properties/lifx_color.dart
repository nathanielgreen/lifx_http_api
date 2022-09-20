import 'package:json_annotation/json_annotation.dart';

part 'lifx_color.g.dart';

@JsonSerializable()
class LIFXColor {
  final double? hue;
  final double? saturation;
  final int? kelvin;

  LIFXColor({this.hue, this.saturation, this.kelvin});

  factory LIFXColor.fromJson(Map<String, dynamic> json) =>
      _$LIFXColorFromJson(json);

  Map<String, dynamic> toJson() => _$LIFXColorToJson(this);
}
