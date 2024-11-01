import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  const Vehicle({
    required this.vehicleCode,
    required this.vehicleName,
    required this.pricePerDay,
  });

  const Vehicle.empty()
      : vehicleCode = '',
        vehicleName = '',
        pricePerDay = 0.0;

  final String vehicleCode;
  final String vehicleName;
  final double pricePerDay;

  @override
  List<Object?> get props => [vehicleCode, vehicleName, pricePerDay];
}
