import 'package:fittin_frontend/domain/models/question/question.dart';

class QuestionRepository {
  final List<Question> _questions = [];

  List<Question> get questions => _questions;

  // TODO: Подгрузка вопросов из внешнего сервиса
  QuestionRepository() {
    // mock вопросы для начала
    _questions.addAll([
      Question(
        number: 1,
        test: "Я люблю читать научно-техническую литературу.",
      ),
      Question(number: 2, test: "У меня хороший аппетит."),
      Question(
        number: 3,
        test: "По утрам я обычно встаю свежим и отдохнувшим.",
      ),
      Question(
        number: 4,
        test: "Думаю, что мне понравилась бы работа библиотекаря.",
      ),
    ]);
  }
}
