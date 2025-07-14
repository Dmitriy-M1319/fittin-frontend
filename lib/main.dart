import 'package:dio/dio.dart';
import 'package:fittin_frontend/data/repository/question_repository.dart';
import 'package:fittin_frontend/data/services/api/rest_client.dart';
import 'package:fittin_frontend/ui/start_screen/view/start_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/env/env.dart';
import 'data/repository/answer_repository.dart';

void main() {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  GetIt.I.registerSingleton<RestClient>(
    RestClient(dio, baseUrl: Environment.apiUrl),
  );
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
