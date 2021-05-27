// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Color _$ColorFromJson(Map<String, dynamic> json) {
  return Color(
    hue: (json['hue'] as num).toDouble(),
    saturation: (json['saturation'] as num).toDouble(),
    kelvin: json['kelvin'] as int,
  );
}

Map<String, dynamic> _$ColorToJson(Color instance) => <String, dynamic>{
      'hue': instance.hue,
      'saturation': instance.saturation,
      'kelvin': instance.kelvin,
    };
