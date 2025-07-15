import 'package:fittin_frontend/data/env/env.dart';
import 'package:fittin_frontend/data/services/api/rest_client.dart';
import 'package:fittin_frontend/domain/models/question/question.dart';
import 'package:get_it/get_it.dart';

class QuestionRepository {
  final restClient = GetIt.I.get<RestClient>();
  final List<Question> _questions = [];

  List<Question> get questions => _questions;

  QuestionRepository() {
    if (Environment.demonstrationStage != "debug") {
      restClient.getQuestions().then((qs) {
        _questions.addAll(qs);
      });
    } else {
      _questions.addAll([
        Question(
          number: 0,
          text: "Я люблю читать научно-техническую литературу.",
        ),
        Question(number: 1, text: "У меня хороший аппетит."),
        Question(
          number: 2,
          text: "По утрам я обычно встаю свежим и отдохнувшим.",
        ),
        Question(
          number: 3,
          text: "Думаю, что мне понравилась бы работа библиотекаря.",
        ),
      ]);
    }
  }
}
