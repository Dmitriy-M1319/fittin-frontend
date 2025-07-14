import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

part 'answer.g.dart';

enum AnswerVariant { right, wrong, no_answer }

@freezed
abstract class Answer with _$Answer {
  const factory Answer({
    required int questionNumber,
    required AnswerVariant status,
  }) = _Answer;

  factory Answer.fromJson(Map<String, Object?> json) => _$AnswerFromJson(json);
}
