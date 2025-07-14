import 'package:fittin_frontend/domain/models/answer/answer.dart';

class AnswerRepository {
  String currentAttemptUuid = "";
  final List<Answer> currentAttemptAnswers = [];

  void addAnswer(Answer answer) {
    currentAttemptAnswers.add(answer);
  }
}
