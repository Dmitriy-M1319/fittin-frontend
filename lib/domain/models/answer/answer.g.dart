// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Answer _$AnswerFromJson(Map<String, dynamic> json) => _Answer(
  questionNumber: (json['questionNumber'] as num).toInt(),
  answerVariant: $enumDecode(_$AnswerVariantEnumMap, json['answerVariant']),
);

Map<String, dynamic> _$AnswerToJson(_Answer instance) => <String, dynamic>{
  'questionNumber': instance.questionNumber,
  'answerVariant': _$AnswerVariantEnumMap[instance.answerVariant]!,
};

const _$AnswerVariantEnumMap = {
  AnswerVariant.right: 'right',
  AnswerVariant.wrong: 'wrong',
  AnswerVariant.no_answer: 'no_answer',
};
