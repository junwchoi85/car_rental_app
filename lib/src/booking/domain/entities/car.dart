import 'package:equatable/equatable.dart';

class Car extends Equatable {
  const Car.empty()
      : carCode = '',
        name = '',
        modelYear = '',
        passenger = 0,
        transmission = '',
        luggageLarge = 0,
        luggageSmall = 0,
        engine = '',
        fuel = '',
        status = '';

  const Car({
    required this.carCode,
    required this.name,
    required this.modelYear,
    required this.passenger,
    required this.transmission,
    required this.luggageLarge,
    required this.luggageSmall,
    required this.engine,
    required this.fuel,
    required this.status,
  });

  final String carCode;
  final String name;
  final String modelYear;
  final int passenger;
  final String transmission;
  final int luggageLarge;
  final int luggageSmall;
  final String engine;
  final String fuel;
  final String status;

  @override
  List<Object?> get props => [
        carCode,
        name,
        modelYear,
        // passenger,
        // transmission,
        // luggageLarge,
        // luggageSmall,
        // engine,
        // fuel,
        // status,
      ];
}
