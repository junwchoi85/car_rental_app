import 'package:car_rental_app/src/history/domain/entities/history.dart';

class HistoryModel extends History {
  const HistoryModel({
    required super.pickUpBranchCode,
    required super.dropOffBranchCode,
    required super.pickUpDate,
    required super.dropOffDate,
    required super.pickUpTime,
    required super.dropOffTime,
    // required super.car,
    required super.vehicleCode,
    required super.vehicleName,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      pickUpBranchCode: json['pickUpBranch'],
      dropOffBranchCode: json['dropOffBranch'],
      pickUpDate: json['pickUpDate'],
      dropOffDate: json['dropOffDate'],
      pickUpTime: json['pickUpTime'],
      dropOffTime: json['dropOffTime'],
      // car: json['car'],
      vehicleCode: json['vehicleCode'],
      vehicleName: json['vehicleName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickUpBranch': pickUpBranchCode,
      'dropOffBranch': dropOffBranchCode,
      'pickUpDate': pickUpDate,
      'dropOffDate': dropOffDate,
      'pickUpTime': pickUpTime,
      'dropOffTime': dropOffTime,
      // 'car': car,
      'vehicleCode': vehicleCode,
      'vehicleName': vehicleName,
    };
  }
}
