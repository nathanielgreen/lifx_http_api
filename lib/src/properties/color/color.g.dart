// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifxColor _$LifxColorFromJson(Map<String, dynamic> json) {
  return LifxColor(
    hue: (json['hue'] as num).toDouble(),
    saturation: (json['saturation'] as num).toDouble(),
    kelvin: json['kelvin'] as int,
  );
}

Map<String, dynamic> _$LifxColorToJson(LifxColor instance) => <String, dynamic>{
      'hue': instance.hue,
      'saturation': instance.saturation,
      'kelvin': instance.kelvin,
    };
