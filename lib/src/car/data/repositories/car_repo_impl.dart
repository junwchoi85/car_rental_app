import 'package:car_rental_app/core/errors/exception.dart';
import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/car/data/datasources/car_remote_data_source.dart';
import 'package:car_rental_app/src/car/domain/entities/car.dart';
import 'package:car_rental_app/src/car/domain/repositories/car_repository.dart';

import 'package:dartz/dartz.dart';

class CarRepositoryImpl implements CarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Car>>> getCarList() async {
    try {
      final carList = await remoteDataSource.getCarList();
      return Right(carList);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
