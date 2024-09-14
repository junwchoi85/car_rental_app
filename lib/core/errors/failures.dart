import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({required this.message, required this.statusCode})
      : assert(
          statusCode is String || statusCode is int,
          'status code cannot be a ${statusCode.runtimeType}',
        );

  final String message;
  final dynamic statusCode;

  String get errorMessage => '$statusCode Error: $message';

  @override
  List<Object> get props => [message, statusCode];
}

/// [CacheFailure] is a class that extends [Failure] class
/// and is used to represent a failure that occurs when
/// caching data.
class CacheFailure extends Failure {
  CacheFailure({required super.message, required super.statusCode});
}

/// [ServerFailure] is a class that extends [Failure] class
/// and is used to represent a failure that occurs when
/// communicating with the server.
class ServerFailure extends Failure {
  /// [ServerFailure] constructor
  ServerFailure({required super.message, required super.statusCode});

  /// [ServerFailure.fromException] is a named constructor
  ServerFailure.fromException(Exception e)
      : super(
          message: e.toString(),
          statusCode: e.runtimeType.toString(),
        );
}
