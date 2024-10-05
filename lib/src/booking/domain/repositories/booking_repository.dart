import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<Car>>> getCarList();
  Future<Either<Failure, List<Branch>>> getServiceLocationList();
}
