import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

part 'result.g.dart';

@freezed
abstract class TestResult with _$TestResult {
  const factory TestResult({
    required String information,
    required List<ScaleResult> scales,
    required String uuid,
  }) = _TestResult;

  factory TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);
}

@freezed
abstract class ScaleResult with _$ScaleResult {
  const factory ScaleResult({required String scale, required int value}) =
      _ScaleResult;

  factory ScaleResult.fromJson(Map<String, dynamic> json) =>
      _$ScaleResultFromJson(json);
}
