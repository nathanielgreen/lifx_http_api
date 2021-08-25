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
    power: _$enumDecode(_$LifxPowerEnumMap, json['power']),
    color: LifxColor.fromJson(json['color'] as Map<String, dynamic>),
    brightness: (json['brightness'] as num).toDouble(),
    group: LifxGroup.fromJson(json['group'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BulbToJson(Bulb instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'label': instance.label,
      'connected': instance.connected,
      'group': instance.group,
      'power': _$LifxPowerEnumMap[instance.power],
      'color': instance.color,
      'brightness': instance.brightness,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$LifxPowerEnumMap = {
  LifxPower.on: 'on',
  LifxPower.off: 'off',
};
