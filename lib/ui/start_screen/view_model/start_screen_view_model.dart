import 'package:fittin_frontend/data/repository/answer_repository.dart';
import 'package:fittin_frontend/data/services/api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

class StartScreenViewModel extends ChangeNotifier {
  final _answerRepository = GetIt.I.get<AnswerRepository>();
  final _restClient = GetIt.I.get<RestClient>();

  Future<void> startTest() async {
    UuidV4 uuid = UuidV4();
    _answerRepository.currentAttemptUuid = uuid.generate();
    await _restClient.createTestAttempt(
      TestAttemptRequest(uuid: _answerRepository.currentAttemptUuid),
    );
  }
}

final startScreenProvider = ChangeNotifierProvider.autoDispose(
  (ref) => StartScreenViewModel(),
);
