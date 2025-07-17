import 'package:fittin_frontend/data/repository/answer_repository.dart';
import 'package:fittin_frontend/data/repository/question_repository.dart';
import 'package:fittin_frontend/domain/models/answer/answer.dart';
import 'package:fittin_frontend/domain/models/question/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class QuestionPageViewModel extends ChangeNotifier {
  final _questionRepository = GetIt.I.get<QuestionRepository>();
  final _answerRepository = GetIt.I.get<AnswerRepository>();

  int _currentQuestionNumber = 1;
  bool _isTestCompleted = false;

  Question get currentQuestion =>
      _questionRepository.questions[_currentQuestionNumber - 1];

  int get currentQuestionNumber => _currentQuestionNumber;
  int get totalQuestions => _questionRepository.questions.length;
  bool get isTestCompleted => _isTestCompleted;

  void addAnswer(AnswerVariant variant) {
    _answerRepository.addAnswer(
      Answer(questionNumber: _currentQuestionNumber, answerVariant: variant),
    );
    if (_currentQuestionNumber == _questionRepository.questions.length) {
      _isTestCompleted = true;
    } else {
      _currentQuestionNumber++;
    }
    notifyListeners();
  }

  void answerAll(bool allTrue) {
    final questions = _questionRepository.questions;
    final currentNumber = _currentQuestionNumber;

    for (int i = currentNumber; i <= questions.length; i++) {
      _answerRepository.addAnswer(
        Answer(
          questionNumber: i,
          answerVariant: allTrue ? AnswerVariant.right : AnswerVariant.wrong,
        ),
      );
    }

    _currentQuestionNumber = questions.length;
    _isTestCompleted = true;
    notifyListeners();
  }
}

final questionPageProvider = ChangeNotifierProvider(
  (ref) => QuestionPageViewModel(),
);
