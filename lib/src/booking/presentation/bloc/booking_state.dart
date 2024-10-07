part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {
  final Booking initialBooking;

  BookingInitial()
      : initialBooking = Booking(
          pickUpBranch: const Branch.empty(),
          dropOffBranch: const Branch.empty(),
          pickUpDate: DatetimeUtils.dateNow(),
          dropOffDate: DatetimeUtils.twoDaysFromNow(),
          pickUpTime: '12:00 PM',
          dropOffTime: '12:00 PM',
        );
  Booking get booking => initialBooking;
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
    return BookingDetailsUpdated(
      Booking(
        pickUpBranch: pickUpBranch ?? carRental.pickUpBranch,
        dropOffBranch: dropOffBranch ?? carRental.dropOffBranch,
        pickUpDate: pickUpDate ?? carRental.pickUpDate,
        dropOffDate: dropOffDate ?? carRental.dropOffDate,
        pickUpTime: pickUpTime ?? carRental.pickUpTime,
        dropOffTime: dropOffTime ?? carRental.dropOffTime,
      ),
    );
  }

  @override
  List<Object> get props => [carRental];
}

class ServiceLocationsLoading extends BookingState {
  const ServiceLocationsLoading();
}

class ServiceLocationsError extends BookingState {
  final String message;

  const ServiceLocationsError(this.message);

  @override
  List<Object> get props => [message];
}

class ServiceLocationsLoaded extends BookingState {
  final List<Branch> branches;

  const ServiceLocationsLoaded(this.branches);

  @override
  List<Object> get props => [branches];
}

class ServiceLocationSelected extends BookingState {
  final Branch selectedBranch;

  const ServiceLocationSelected(this.selectedBranch);

  @override
  List<Object> get props => [selectedBranch];
}
