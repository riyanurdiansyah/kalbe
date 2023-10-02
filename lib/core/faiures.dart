import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class CustomFailure extends Failure {
  final int code;
  final String message;

  const CustomFailure(
    this.code,
    this.message,
  );

  @override
  List<Object?> get props => [code, message];
}
