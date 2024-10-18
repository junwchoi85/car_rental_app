import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/booking/domain/entities/booking.dart';
import 'package:car_rental_app/src/booking/domain/repositories/booking_repository.dart';

class BookACar extends UsecaseWithParams<void, Booking> {
  final BookingRepository _repository;

  BookACar(this._repository);

  @override
  ResultFuture<void> call(Booking params) => _repository.bookACar(params);
}
