import 'package:car_rental_app/core/errors/failures.dart';
import 'package:car_rental_app/src/history/data/datasources/hisoty_remote_data_source.dart';
import 'package:car_rental_app/src/history/domain/entities/history.dart';
import 'package:car_rental_app/src/history/domain/repositories/history_repository.dart';
import 'package:dartz/dartz.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  const HistoryRepositoryImpl({
    required HistoryRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final HistoryRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<History>>> getHistoryList() async {
    final historyList = await _remoteDataSource.getHistoryList();
    return Right(historyList);
  }
}
