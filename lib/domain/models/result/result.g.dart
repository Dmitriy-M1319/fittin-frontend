// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestResult _$TestResultFromJson(Map<String, dynamic> json) => _TestResult(
  information: json['information'] as String,
  scales: (json['scales'] as List<dynamic>)
      .map((e) => ScaleResult.fromJson(e as Map<String, dynamic>))
      .toList(),
  uuid: json['uuid'] as String,
);

Map<String, dynamic> _$TestResultToJson(_TestResult instance) =>
    <String, dynamic>{
      'information': instance.information,
      'scales': instance.scales,
      'uuid': instance.uuid,
    };

_ScaleResult _$ScaleResultFromJson(Map<String, dynamic> json) => _ScaleResult(
  scale: json['scale'] as String,
  value: (json['value'] as num).toInt(),
);

Map<String, dynamic> _$ScaleResultToJson(_ScaleResult instance) =>
    <String, dynamic>{'scale': instance.scale, 'value': instance.value};
