import 'package:car_rental_app/core/errors/exception.dart';
import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/branch/data/datasources/branch_remote_data_source.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/branch/domain/repositories/branch_repository.dart';
import 'package:dartz/dartz.dart';

class BranchRepositoryImpl implements BranchRepository {
  const BranchRepositoryImpl(this._remoteDataSource);

  final BranchRemoteDataSource _remoteDataSource;
  @override
  Future<Either<Failure, List<Branch>>> getBranchList() async {
    try {
      final branchList = await _remoteDataSource.getBranchList();
      return Right(branchList);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
