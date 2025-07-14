import 'package:fittin_frontend/data/services/api/rest_client.dart';
import 'package:fittin_frontend/domain/models/question/question.dart';
import 'package:get_it/get_it.dart';

class QuestionRepository {
  final restClient = GetIt.I.get<RestClient>();
  final List<Question> _questions = [];

  List<Question> get questions => _questions;
  
  QuestionRepository() {
    restClient.getQuestions().then((qs) {
      _questions.addAll(qs);
    });
  }
}
