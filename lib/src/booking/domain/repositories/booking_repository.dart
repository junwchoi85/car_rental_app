import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/booking/domain/entities/booking.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<Car>>> getCarList();
  ResultFuture<List<Vehicle>> getVehicleList();
  Future<Either<Failure, List<Branch>>> getServiceLocationList();
  ResultFuture<void> bookACar(Booking booking);
}
