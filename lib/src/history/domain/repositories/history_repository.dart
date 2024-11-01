import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/history/domain/entities/history.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<History>>> getHistoryList();
}
