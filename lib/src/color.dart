import 'package:json_annotation/json_annotation.dart';

part 'color.g.dart';

@JsonSerializable()
class Color {
  double hue;
  double saturation;
  int kelvin;

  Color({required this.hue, required this.saturation, required this.kelvin});

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorToJson(this);
}
