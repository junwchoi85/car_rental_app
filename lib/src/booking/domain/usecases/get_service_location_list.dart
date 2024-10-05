import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/booking/domain/repositories/booking_repository.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';

class GetServiceLocationList implements UsecaseWithoutParams<List<Branch>> {
  const GetServiceLocationList(this.repository);

  final BookingRepository repository;

  @override
  ResultFuture<List<Branch>> call() async {
    return await repository.getServiceLocationList();
  }
}
