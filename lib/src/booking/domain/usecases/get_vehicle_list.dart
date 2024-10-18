import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/booking/domain/repositories/booking_repository.dart';

class GetVehicleList implements UsecaseWithoutParams<List<Vehicle>> {
  const GetVehicleList(this.repository);

  final BookingRepository repository;

  @override
  ResultFuture<List<Vehicle>> call() async {
    return await repository.getVehicleList();
  }
}
