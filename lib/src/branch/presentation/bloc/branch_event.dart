part of 'branch_bloc.dart';

abstract class BranchEvent extends Equatable {
  const BranchEvent();

  @override
  List<Object> get props => [];
}

class LoadBranchesEvent extends BranchEvent {
  const LoadBranchesEvent();
}
