import 'package:car_rental_app/src/history/domain/entities/history.dart';
import 'package:car_rental_app/src/history/domain/usecases/get_history_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required GetHistoryList getHistoryList})
      : _getHistoryList = getHistoryList,
        super(const HistoryInitial()) {
    on<LoadHistoryEvent>(_loadHistoryListHandler);
  }

  final GetHistoryList _getHistoryList;

  Future<void> _loadHistoryListHandler(
    LoadHistoryEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(const HistoryLoading());

    final result = await _getHistoryList();

    result.fold(
      (failure) => emit(HistoryError(failure.errorMessage)),
      (histories) => emit(HistoryLoaded(histories)),
    );
  }
}
