import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? statusCode;
  final String? responseMessage;
  final Exception? exception;

  const Failure([this.statusCode, this.responseMessage, this.exception]);

  @override
  List<Object?> get props => [statusCode, responseMessage, exception];
}
