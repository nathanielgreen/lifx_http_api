// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lifx_bulb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LIFXBulb _$LIFXBulbFromJson(Map<String, dynamic> json) => LIFXBulb(
      id: json['id'] as String,
      uuid: json['uuid'] as String,
      label: json['label'] as String,
      connected: json['connected'] as bool,
      power: $enumDecode(_$LIFXPowerEnumMap, json['power']),
      color: LIFXColor.fromJson(json['color'] as Map<String, dynamic>),
      brightness: (json['brightness'] as num).toDouble(),
      group: LIFXGroup.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LIFXBulbToJson(LIFXBulb instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'label': instance.label,
      'connected': instance.connected,
      'group': instance.group,
      'power': _$LIFXPowerEnumMap[instance.power]!,
      'color': instance.color,
      'brightness': instance.brightness,
    };

const _$LIFXPowerEnumMap = {
  LIFXPower.on: 'on',
  LIFXPower.off: 'off',
};
