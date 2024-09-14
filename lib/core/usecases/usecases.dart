import 'package:car_rental_app/core/utils/typedefs.dart';

/// A usecase that requires parameters
abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

/// A usecase that does not require parameters
abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}
