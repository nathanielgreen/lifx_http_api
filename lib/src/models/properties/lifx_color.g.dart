// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifx_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LIFXColor _$LIFXColorFromJson(Map<String, dynamic> json) => LIFXColor(
      hue: (json['hue'] as num?)?.toDouble(),
      saturation: (json['saturation'] as num?)?.toDouble(),
      kelvin: json['kelvin'] as int?,
    );

Map<String, dynamic> _$LIFXColorToJson(LIFXColor instance) => <String, dynamic>{
      'hue': instance.hue,
      'saturation': instance.saturation,
      'kelvin': instance.kelvin,
    };
