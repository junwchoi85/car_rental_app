import 'package:car_rental_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

/// A [Future] that returns a [Either] of [Failure] or [T]
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// A [Map] that has [String] as key and [dynamic] as value
typedef DataMap = Map<String, dynamic>;
