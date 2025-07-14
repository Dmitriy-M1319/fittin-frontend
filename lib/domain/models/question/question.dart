import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({required int number, required String text}) =
      _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}
