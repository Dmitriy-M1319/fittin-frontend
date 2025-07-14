// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Answer _$AnswerFromJson(Map<String, dynamic> json) => _Answer(
  questionNumber: (json['questionNumber'] as num).toInt(),
  status: $enumDecode(_$AnswerVariantEnumMap, json['status']),
);

Map<String, dynamic> _$AnswerToJson(_Answer instance) => <String, dynamic>{
  'questionNumber': instance.questionNumber,
  'status': _$AnswerVariantEnumMap[instance.status]!,
};

const _$AnswerVariantEnumMap = {
  AnswerVariant.right: 'right',
  AnswerVariant.wrong: 'wrong',
  AnswerVariant.no_answer: 'no_answer',
};
