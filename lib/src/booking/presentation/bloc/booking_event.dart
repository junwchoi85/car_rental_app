part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();
}

class UpdateBookingDetailEvent extends BookingEvent {
  const UpdateBookingDetailEvent({
    this.pickUpBranch,
    this.dropOffBranch,
    this.pickUpDate,
    this.dropOffDate,
    this.pickUpTime,
    this.dropOffTime,
  });

  final Branch? pickUpBranch;
  final Branch? dropOffBranch;
  final String? pickUpDate;
  final String? dropOffDate;
  final String? pickUpTime;
  final String? dropOffTime;

  @override
  List<Object?> get props => [
        pickUpBranch,
        dropOffBranch,
        pickUpDate,
        dropOffDate,
        pickUpTime,
        dropOffTime,
      ];
}

class LoadBranchesEvent extends BookingEvent {
  const LoadBranchesEvent();

  @override
  List<Object?> get props => [];
}
