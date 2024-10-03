part of 'car_rental_bloc.dart';

abstract class CarRentalEvent extends Equatable {
  const CarRentalEvent();
}

class UpdateRentalDetailEvent extends CarRentalEvent {
  const UpdateRentalDetailEvent({
    this.pickUpBranchCode,
    this.dropOffBranchCode,
    this.pickUpDate,
    this.dropOffDate,
    this.pickUpTime,
    this.dropOffTime,
  });

  final String? pickUpBranchCode;
  final String? dropOffBranchCode;
  final String? pickUpDate;
  final String? dropOffDate;
  final String? pickUpTime;
  final String? dropOffTime;

  @override
  List<Object?> get props => [
        pickUpBranchCode,
        dropOffBranchCode,
        pickUpDate,
        dropOffDate,
        pickUpTime,
        dropOffTime,
      ];
}
