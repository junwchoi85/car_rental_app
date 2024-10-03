part of 'car_rental_bloc.dart';

sealed class CarRentalState extends Equatable {
  const CarRentalState();

  @override
  List<Object> get props => [];
}

class CarRentalInitial extends CarRentalState {
  const CarRentalInitial();
}

class CarRentalDetailsUpdated extends CarRentalState {
  const CarRentalDetailsUpdated(this.carRental);

  final CarRental carRental;

  CarRentalDetailsUpdated copyWith({
    String? pickUpBranchCode,
    String? dropOffBranchCode,
    String? pickUpDate,
    String? dropOffDate,
    String? pickUpTime,
    String? dropOffTime,
  }) {
    final test = CarRentalDetailsUpdated(
      CarRental(
        pickUpBranchCode: pickUpBranchCode ?? carRental.pickUpBranchCode,
        dropOffBranchCode: dropOffBranchCode ?? carRental.dropOffBranchCode,
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
