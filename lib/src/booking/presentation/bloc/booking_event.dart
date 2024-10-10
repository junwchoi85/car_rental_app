part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object?> get props => [];
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

class LoadServiceLocationsEvent extends BookingEvent {
  const LoadServiceLocationsEvent();
}

class SelectServiceLocationEvent extends BookingEvent {
  const SelectServiceLocationEvent({
    required this.serviceLocation,
    required this.serviceType,
  });

  final String serviceLocation;
  final ServiceType serviceType;

  @override
  List<Object?> get props => [serviceLocation];
}

class CancelServiceLocationEvent extends BookingEvent {
  const CancelServiceLocationEvent();
}

class SelectCarEvent extends BookingEvent {
  const SelectCarEvent({
    required this.car,
  });

  final Car car;

  @override
  List<Object?> get props => [car];
}

class ChooseOptionsEvent extends BookingEvent {
  const ChooseOptionsEvent();
}

class ConfirmBookingEvent extends BookingEvent {
  const ConfirmBookingEvent();
}
