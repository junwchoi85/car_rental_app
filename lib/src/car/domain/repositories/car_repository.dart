import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/car/domain/entities/car.dart';
import 'package:dartz/dartz.dart';

abstract class CarRepository {
  Future<Either<Failure, List<Car>>> getCarList();
}
