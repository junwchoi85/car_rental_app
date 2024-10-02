import 'package:equatable/equatable.dart';

class CarRental extends Equatable {
  const CarRental({
    required this.pickUpBranchCode,
    required this.dropOffBranchCode,
    required this.pickUpDate,
    required this.dropOffDate,
    required this.pickUpTime,
    required this.dropOffTime,
  });

  final String pickUpBranchCode;
  final String dropOffBranchCode;
  final String pickUpDate;
  final String dropOffDate;
  final String pickUpTime;
  final String dropOffTime;

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
