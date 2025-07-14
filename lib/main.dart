import 'package:fittin_frontend/data/repository/question_repository.dart';
import 'package:fittin_frontend/ui/start_screen/view/start_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/repository/answer_repository.dart';

void main() {
  GetIt.I.registerSingleton<QuestionRepository>(QuestionRepository());
  GetIt.I.registerSingleton<AnswerRepository>(AnswerRepository());

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: IntroScreenView(),
    );
  }
}
