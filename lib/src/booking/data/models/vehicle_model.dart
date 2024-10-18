import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  const VehicleModel({
    required super.vehicleCode,
    required super.vehicleName,
    required super.pricePerDay,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleCode: json['vehicleCode'],
      vehicleName: json['vehicleName'],
      pricePerDay: json['pricePerDay'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleCode': vehicleCode,
      'vehicleName': vehicleName,
      'pricePerDay': pricePerDay,
    };
  }
}
