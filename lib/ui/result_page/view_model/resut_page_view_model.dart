import 'package:fittin_frontend/data/env/env.dart';
import 'package:fittin_frontend/data/repository/answer_repository.dart';
import 'package:fittin_frontend/data/services/api/rest_client.dart';
import 'package:fittin_frontend/domain/models/result/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class ResultPageViewModel with ChangeNotifier {
  final answerRepository = GetIt.I.get<AnswerRepository>();
  final restClient = GetIt.I.get<RestClient>();
  bool isResultCalculating = false;
  TestResult calculatedResult = TestResult(
    uuid: 'mock-12345-67890',
    scales: [
      ScaleResult(scale: '(Hs)', value: 65),
      ScaleResult(scale: '(D)', value: 72),
      ScaleResult(scale: '(Hy)', value: 58),
      ScaleResult(scale: '(Pd)', value: 80),
      ScaleResult(scale: '(Mf)', value: 45),
      ScaleResult(scale: '(Pa)', value: 68),
      ScaleResult(scale: '(Pt)', value: 75),
      ScaleResult(scale: '(Sc)', value: 82),
      ScaleResult(scale: '(Ma)', value: 60),
      ScaleResult(scale: '(Si)', value: 38),
    ],
    information: '''
Профиль показывает выраженные пики по шкалам 4 (Психопатия), 8 (Шизофрения) и 7 (Тревожность), что может указывать на:
- Импульсивность и склонность к конфликтам (шкала 4)
- Необычность мышления и восприятия (шкала 8)
- Высокий уровень тревоги и беспокойства (шкала 7)

Низкий показатель по шкале 0 (Интроверсия) говорит о высокой общительности.
Рекомендуется консультация специалиста для детального анализа.
''',
  );

  ResultPageViewModel() {
    calculateResult();
  }

  Future<void> calculateResult() async {
    isResultCalculating = true;
    notifyListeners();
    if (Environment.demonstrationStage != "debug") {
      TestResult result = await restClient.calculateTestResult(
        TestAttemptRequest(uuid: answerRepository.currentAttemptUuid),
      );
      calculatedResult = result;
    } else {
      await Future.delayed(Duration(seconds: 3));
    }

    isResultCalculating = false;
    notifyListeners();
  }
}

final resultPageProvider = ChangeNotifierProvider.autoDispose(
  (ref) => ResultPageViewModel(),
);
