import 'package:car_rental_app/core/errors/exception.dart';
import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:car_rental_app/src/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:dartz/dartz.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try {
      final result = await _localDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
