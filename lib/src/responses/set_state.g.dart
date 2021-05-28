// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetStateBody _$SetStateBodyFromJson(Map<String, dynamic> json) {
  return SetStateBody(
    results: (json['results'] as List<dynamic>)
        .map((e) => SetStateResults.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SetStateBodyToJson(SetStateBody instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SetStateResults _$SetStateResultsFromJson(Map<String, dynamic> json) {
  return SetStateResults(
    id: json['id'] as String,
    label: json['label'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$SetStateResultsToJson(SetStateResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'status': instance.status,
    };
