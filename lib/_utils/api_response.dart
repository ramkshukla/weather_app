import 'package:dartz/dartz.dart';

typedef APIResponse<T> = Either<Failure, T>;

class Failure {
  final int code;
  final Object message;

  Failure({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return "Failure(Code: $code, message: $message)";
  }
}
