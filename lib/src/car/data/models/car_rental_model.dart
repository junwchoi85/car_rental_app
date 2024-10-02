import 'package:car_rental_app/src/car/domain/entities/car_rental.dart';

class CarRentalModel extends CarRental {
  const CarRentalModel({
    required super.pickUpBranchCode,
    required super.dropOffBranchCode,
    required super.pickUpDate,
    required super.dropOffDate,
    required super.pickUpTime,
    required super.dropOffTime,
  });

  factory CarRentalModel.fromJson(Map<String, dynamic> json) {
    return CarRentalModel(
      pickUpBranchCode: json['pickUpBranchCode'],
      dropOffBranchCode: json['dropOffBranchCode'],
      pickUpDate: json['pickUpDate'],
      dropOffDate: json['dropOffDate'],
      pickUpTime: json['pickUpTime'],
      dropOffTime: json['dropOffTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickUpBranchCode': pickUpBranchCode,
      'dropOffBranchCode': dropOffBranchCode,
      'pickUpDate': pickUpDate,
      'dropOffDate': dropOffDate,
      'pickUpTime': pickUpTime,
      'dropOffTime': dropOffTime,
    };
  }
}
