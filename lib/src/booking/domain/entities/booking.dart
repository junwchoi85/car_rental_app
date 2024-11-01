import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  const Booking({
    required this.pickUpBranch,
    required this.dropOffBranch,
    required this.pickUpDate,
    required this.dropOffDate,
    required this.pickUpTime,
    required this.dropOffTime,
    required this.car,
    required this.vehicle,
  });

  final Branch pickUpBranch;
  final Branch dropOffBranch;
  final String pickUpDate;
  final String dropOffDate;
  final String pickUpTime;
  final String dropOffTime;
  final Car car;
  final Vehicle vehicle;

  @override
  List<Object?> get props => [
        pickUpBranch,
        dropOffBranch,
        pickUpDate,
        dropOffDate,
        pickUpTime,
        dropOffTime,
        car,
        vehicle,
      ];

  Booking copyWith({
    Branch? pickUpBranch,
    Branch? dropOffBranch,
    String? pickUpDate,
    String? dropOffDate,
    String? pickUpTime,
    String? dropOffTime,
    Car? car,
    Vehicle? vehicle,
  }) {
    return Booking(
      pickUpBranch: pickUpBranch ?? this.pickUpBranch,
      dropOffBranch: dropOffBranch ?? this.dropOffBranch,
      pickUpDate: pickUpDate ?? this.pickUpDate,
      dropOffDate: dropOffDate ?? this.dropOffDate,
      pickUpTime: pickUpTime ?? this.pickUpTime,
      dropOffTime: dropOffTime ?? this.dropOffTime,
      car: car ?? this.car,
      vehicle: vehicle ?? this.vehicle,
    );
  }
}
