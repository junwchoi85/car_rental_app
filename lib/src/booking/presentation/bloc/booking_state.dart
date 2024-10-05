part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {
  const BookingInitial();
}

class BookingDetailsUpdated extends BookingState {
  const BookingDetailsUpdated(this.carRental);

  final Booking carRental;

  BookingDetailsUpdated copyWith({
    Branch? pickUpBranch,
    Branch? dropOffBranch,
    String? pickUpDate,
    String? dropOffDate,
    String? pickUpTime,
    String? dropOffTime,
  }) {
    final test = BookingDetailsUpdated(
      Booking(
        pickUpBranch: pickUpBranch ?? carRental.pickUpBranch,
        dropOffBranch: dropOffBranch ?? carRental.dropOffBranch,
        pickUpDate: pickUpDate ?? carRental.pickUpDate,
        dropOffDate: dropOffDate ?? carRental.dropOffDate,
        pickUpTime: pickUpTime ?? carRental.pickUpTime,
        dropOffTime: dropOffTime ?? carRental.dropOffTime,
      ),
    );
    return test;
  }

  @override
  List<Object> get props => [carRental];
}

class BranchLoading extends BookingState {
  const BranchLoading();
}

class BranchLoaded extends BookingState {
  final List<Branch> branches;

  const BranchLoaded(this.branches);

  @override
  List<Object> get props => [branches];
}

class BranchError extends BookingState {
  final String message;

  const BranchError(this.message);

  @override
  List<Object> get props => [message];
}
