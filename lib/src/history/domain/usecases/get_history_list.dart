import 'package:car_rental_app/core/usecases/usecases.dart';
import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/history/domain/entities/history.dart';
import 'package:car_rental_app/src/history/domain/repositories/history_repository.dart';

class GetHistoryList implements UsecaseWithoutParams<List<History>> {
  const GetHistoryList({
    required this.repository,
  });
  final HistoryRepository repository;

  @override
  ResultFuture<List<History>> call() async {
    return await repository.getHistoryList();
  }
}
