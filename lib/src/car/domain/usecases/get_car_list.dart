import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/car/domain/entities/car.dart';
import 'package:car_rental_app/src/car/domain/repositories/car_repository.dart';

class GetCarList implements UsecaseWithoutParams<List<Car>> {
  const GetCarList(this.repository);

  final CarRepository repository;

  @override
  ResultFuture<List<Car>> call() async {
    return await repository.getCarList();
  }
}
