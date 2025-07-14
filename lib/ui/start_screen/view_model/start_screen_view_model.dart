import 'package:fittin_frontend/data/repository/answer_repository.dart';
import 'package:fittin_frontend/ui/question_page/view/question_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

class StartScreenViewModel extends ChangeNotifier {
  final _answerRepository = GetIt.I.get<AnswerRepository>();

  void startTest() {
    UuidV4 uuid = UuidV4();
    _answerRepository.currentAttemptUuid = uuid.generate();
  }
}

final startScreenProvider = ChangeNotifierProvider.autoDispose(
  (ref) => StartScreenViewModel(),
);
