// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bulb _$BulbFromJson(Map<String, dynamic> json) {
  return Bulb(
    id: json['id'] as String,
    uuid: json['uuid'] as String,
    label: json['label'] as String,
    connected: json['connected'] as bool,
    power: json['power'] as String,
    color: Color.fromJson(json['color'] as Map<String, dynamic>),
    brightness: (json['brightness'] as num).toDouble(),
  );
}

Map<String, dynamic> _$BulbToJson(Bulb instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'label': instance.label,
      'connected': instance.connected,
      'power': instance.power,
      'color': instance.color,
      'brightness': instance.brightness,
    };
