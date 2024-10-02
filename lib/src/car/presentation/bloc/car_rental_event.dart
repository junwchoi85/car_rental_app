part of 'car_rental_bloc.dart';

abstract class CarRentalEvent extends Equatable {
  const CarRentalEvent();
}

class UpdatePickUpBranchEvent extends CarRentalEvent {
  const UpdatePickUpBranchEvent(this.pickUpBranchCode);

  final String pickUpBranchCode;

  @override
  List<Object> get props => [pickUpBranchCode];
}

class UpdateDropOffBranchEvent extends CarRentalEvent {
  const UpdateDropOffBranchEvent(this.dropOffBranchCode);

  final String dropOffBranchCode;

  @override
  List<Object> get props => [dropOffBranchCode];
}

class UpdatePickUpDateEvent extends CarRentalEvent {
  const UpdatePickUpDateEvent(this.pickUpDate);

  final String pickUpDate;

  @override
  List<Object> get props => [pickUpDate];
}

class UpdateDropOffDateEvent extends CarRentalEvent {
  const UpdateDropOffDateEvent(this.dropOffDate);

  final String dropOffDate;

  @override
  List<Object> get props => [dropOffDate];
}

class UpdatePickUpTimeEvent extends CarRentalEvent {
  const UpdatePickUpTimeEvent(this.pickUpTime);

  final String pickUpTime;

  @override
  List<Object> get props => [pickUpTime];
}

class UpdateDropOffTimeEvent extends CarRentalEvent {
  const UpdateDropOffTimeEvent(this.dropOffTime);

  final String dropOffTime;

  @override
  List<Object> get props => [dropOffTime];
}
