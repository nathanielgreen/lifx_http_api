import 'package:json_annotation/json_annotation.dart';

part 'color.g.dart';

@JsonSerializable()
class LifxColor {
  double? hue;
  double? saturation;
  int? kelvin;

  LifxColor({this.hue, this.saturation, this.kelvin});

  factory LifxColor.fromJson(Map<String, dynamic> json) =>
      _$LifxColorFromJson(json);

  Map<String, dynamic> toJson() => _$LifxColorToJson(this);
}
