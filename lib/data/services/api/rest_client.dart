import 'package:dio/dio.dart';
import 'package:fittin_frontend/domain/models/answer/answer.dart';
import 'package:fittin_frontend/domain/models/question/question.dart';
import 'package:fittin_frontend/domain/models/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://localhost:8050')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/questions')
  Future<List<Question>> getQuestions();

  @POST('/attempt')
  Future<void> createTestAttempt(@Body() TestAttemptRequest request);

  @POST('/answer')
  Future<void> addNewAnswer(@Body() TestAnswerAddRequest request);

  @POST('/calculate')
  Future<TestResult> calculateTestResult(@Body() TestAttemptRequest request);
}

@JsonSerializable()
class TestAttemptRequest {
  const TestAttemptRequest({this.uuid});

  factory TestAttemptRequest.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptRequestFromJson(json);

  final String? uuid;

  Map<String, dynamic> toJson() => _$TestAttemptRequestToJson(this);
}

@JsonSerializable()
class TestAnswerAddRequest {
  const TestAnswerAddRequest({this.uuid, this.answer});

  factory TestAnswerAddRequest.fromJson(Map<String, dynamic> json) =>
      _$TestAnswerAddRequestFromJson(json);

  final String? uuid;
  final Answer? answer;

  Map<String, dynamic> toJson() => _$TestAnswerAddRequestToJson(this);
}
