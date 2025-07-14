import 'package:fittin_frontend/data/services/api/rest_client.dart';
import 'package:fittin_frontend/domain/models/answer/answer.dart';
import 'package:get_it/get_it.dart';

class AnswerRepository {
  final _restClient = GetIt.I.get<RestClient>();
  String currentAttemptUuid = "";
  final List<Answer> currentAttemptAnswers = [];

  Future<void> addAnswer(Answer answer) async {
    currentAttemptAnswers.add(answer);
    await _restClient.addNewAnswer(
      TestAnswerAddRequest(
        uuid: currentAttemptUuid,
        answer: Answer(
          questionNumber: answer.questionNumber,
          answerVariant: answer.answerVariant,
        ),
      ),
    );
  }
}
