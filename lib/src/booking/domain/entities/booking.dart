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
  });

  final Branch pickUpBranch;
  final Branch dropOffBranch;
  final String pickUpDate;
  final String dropOffDate;
  final String pickUpTime;
  final String dropOffTime;

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
