// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetStateBody _$SetStateBodyFromJson(Map<String, dynamic> json) => SetStateBody(
      results: (json['results'] as List<dynamic>)
          .map((e) => SetStateResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetStateBodyToJson(SetStateBody instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SetStateResult _$SetStateResultFromJson(Map<String, dynamic> json) =>
    SetStateResult(
      id: json['id'] as String,
      label: json['label'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$SetStateResultToJson(SetStateResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'status': instance.status,
    };
