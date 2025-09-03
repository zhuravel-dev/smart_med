import 'package:smart_med/infra/helpers/failures.dart';

class Result<T> {
  final T? data;
  final Object? exception;

  const Result({this.data, this.exception});

  bool get hasData => data != null;
  bool get isCorrectWork => exception == null;
  bool get hasError => exception != null;
  bool get hasFailure => exception is Failure;
  String get errorMessage => exception?.toString() ?? '';

  factory Result.correct(T data) => Result(data: data);
  factory Result.error(Object exception) => Result(exception: exception);
  factory Result.failure(Failure failure) => Result(exception: failure);
  factory Result.empty() => const Result();
}
