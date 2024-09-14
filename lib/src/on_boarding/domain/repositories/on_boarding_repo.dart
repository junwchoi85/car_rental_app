import 'package:car_rental_app/core/utils/typedefs.dart';

/// abstract class [OnBoardingRepo] is the contract for [OnBoardingRepoImpl]
abstract class OnBoardingRepo {
  // const constructor for [OnBoardingRepo]
  const OnBoardingRepo();

  ResultFuture<void> cacheFirstTimer();

  ResultFuture<bool> checkIfUserIsFirstTimer();
}
