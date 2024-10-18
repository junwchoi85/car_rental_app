import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:equatable/equatable.dart';

class History extends Equatable {
  const History({
    required this.pickUpBranchCode,
    required this.dropOffBranchCode,
    required this.pickUpDate,
    required this.dropOffDate,
    required this.pickUpTime,
    required this.dropOffTime,
    // required this.car,
    required this.vehicleCode,
    required this.vehicleName,
  });

  final String pickUpBranchCode;
  final String dropOffBranchCode;
  final String pickUpDate;
  final String dropOffDate;
  final String pickUpTime;
  final String dropOffTime;
  // final Car car;
  final String vehicleCode;
  final String vehicleName;

  @override
  List<Object?> get props => [
        pickUpBranchCode,
        dropOffBranchCode,
        pickUpDate,
        dropOffDate,
        pickUpTime,
        dropOffTime,
        // car,
        vehicleCode,
        vehicleName,
      ];
}
