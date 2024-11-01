import 'package:car_rental_app/core/errors/exception.dart';
import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/booking/domain/entities/booking.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/booking/data/datasources/booking_remote_data_source.dart';
import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:car_rental_app/src/booking/domain/repositories/booking_repository.dart';
import 'package:dartz/dartz.dart';

class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this._remoteDataSource);

  final BookingRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Car>>> getCarList() async {
    try {
      final carList = await _remoteDataSource.getCarList();
      return Right(carList);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Branch>>> getServiceLocationList() async {
    try {
      final branchList = await _remoteDataSource.getBranchList();
      return Right(branchList);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<void> bookACar(Booking booking) async {
    try {
      await _remoteDataSource.bookCar(booking: booking);
      return const Right(null);
    } on ServerException catch (e) {
      return ResultFuture.error(
          ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Vehicle>> getVehicleList() async {
    try {
      final vehicleList = await _remoteDataSource.getVehicleList();
      return Right(vehicleList);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
