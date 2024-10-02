import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/branch/domain/usecases/get_branch_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'branch_event.dart';
part 'branch_state.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  BranchBloc({
    required GetBranchList getBranchList,
  })  : _getBranchList = getBranchList,
        super(const BranchInitial()) {
    on<LoadBranchesEvent>(_loadBranchesHandler);
    on<SelectBranchEvent>(_branchSelectedHandler);
  }
  final GetBranchList _getBranchList;

  Future<void> _loadBranchesHandler(
    LoadBranchesEvent event,
    Emitter<BranchState> emit,
  ) async {
    emit(const BranchLoading());

    final result = await _getBranchList();

    result.fold(
      (failure) => emit(BranchError(failure.errorMessage)),
      (branches) => emit(BranchLoaded(branches)),
    );
  }

  Future<void> _branchSelectedHandler(
    SelectBranchEvent event,
    Emitter<BranchState> emit,
  ) async {
    emit(BranchSelected(event.branch));
  }
}
