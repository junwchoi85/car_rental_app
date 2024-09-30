import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:dartz/dartz.dart';

abstract class BranchRepository {
  /// Fetches the list of branches.
  Future<Either<Failure, List<Branch>>> getBranchList();
}
