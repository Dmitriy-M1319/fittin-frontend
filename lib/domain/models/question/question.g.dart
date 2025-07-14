// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  number: (json['number'] as num).toInt(),
  text: json['text'] as String,
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'number': instance.number,
  'text': instance.text,
};
