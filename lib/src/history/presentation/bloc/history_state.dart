part of 'history_bloc.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

final class HistoryLoaded extends HistoryState {
  final List<History> historyList;

  const HistoryLoaded(this.historyList);

  @override
  List<Object> get props => [historyList];
}

final class HistoryError extends HistoryState {
  final String message;

  const HistoryError(this.message);

  @override
  List<Object> get props => [message];
}
