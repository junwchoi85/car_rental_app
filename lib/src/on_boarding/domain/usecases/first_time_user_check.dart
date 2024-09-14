import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/on_boarding/domain/repositories/on_boarding_repo.dart';

class FirstTimeUserCheck extends UsecaseWithoutParams<bool> {
  FirstTimeUserCheck(this._repository);

  final OnBoardingRepo _repository;

  @override
  ResultFuture<bool> call() async {
    return _repository.checkIfUserIsFirstTimer();
  }
}
