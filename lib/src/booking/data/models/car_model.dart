import 'package:car_rental_app/src/booking/domain/entities/car.dart';

class CarModel extends Car {
  const CarModel({
    required super.carCode,
    required super.name,
    required super.modelYear,
    required super.passenger,
    required super.transmission,
    required super.luggageLarge,
    required super.luggageSmall,
    required super.engine,
    required super.fuel,
    required super.status,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      carCode: json['carCode'],
      name: json['name'],
      modelYear: json['modelYear'],
      passenger: json['passenger'],
      transmission: json['transmission'],
      luggageLarge: json['luggageLarge'],
      luggageSmall: json['luggageSmall'],
      engine: json['engine'],
      fuel: json['fuel'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carCode': carCode,
      'name': name,
      'modelYear': modelYear,
      'passenger': passenger,
      'transmission': transmission,
      'luggageLarge': luggageLarge,
      'luggageSmall': luggageSmall,
      'engine': engine,
      'fuel': fuel,
      'status': status,
    };
  }
}
