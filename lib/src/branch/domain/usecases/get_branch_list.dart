import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/branch/domain/repositories/branch_repository.dart';

class GetBranchList implements UsecaseWithoutParams<List<Branch>> {
  const GetBranchList(this.repository);

  final BranchRepository repository;

  @override
  ResultFuture<List<Branch>> call() async {
    return await repository.getBranchList();
  }
}
