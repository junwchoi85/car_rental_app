import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  const Booking.empty()
      : pickUpBranch = const Branch.empty(),
        dropOffBranch = const Branch.empty(),
        pickUpDate = '',
        dropOffDate = '',
        pickUpTime = '',
        dropOffTime = '';

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

  Booking copyWith({
    Branch? pickUpBranch,
    Branch? dropOffBranch,
    String? pickUpDate,
    String? dropOffDate,
    String? pickUpTime,
    String? dropOffTime,
  }) {
    return Booking(
      pickUpBranch: pickUpBranch ?? this.pickUpBranch,
      dropOffBranch: dropOffBranch ?? this.dropOffBranch,
      pickUpDate: pickUpDate ?? this.pickUpDate,
      dropOffDate: dropOffDate ?? this.dropOffDate,
      pickUpTime: pickUpTime ?? this.pickUpTime,
      dropOffTime: dropOffTime ?? this.dropOffTime,
    );
  }
}
