part of 'branch_bloc.dart';

abstract class BranchState extends Equatable {
  const BranchState();

  @override
  List<Object> get props => [];
}

class BranchInitial extends BranchState {
  const BranchInitial();
}

class BranchLoading extends BranchState {
  const BranchLoading();
}

class BranchLoaded extends BranchState {
  final List<Branch> branches;

  const BranchLoaded(this.branches);

  @override
  List<Object> get props => [branches];
}

class BranchError extends BranchState {
  final String message;

  const BranchError(this.message);

  @override
  List<Object> get props => [message];
}

class BranchSelected extends BranchState {
  final Branch branch;

  const BranchSelected(this.branch);

  @override
  List<Object> get props => [branch];
}
