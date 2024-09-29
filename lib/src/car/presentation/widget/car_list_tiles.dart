import 'package:car_rental_app/src/car/domain/entities/car.dart';
import 'package:flutter/material.dart';

class CarListTile extends StatelessWidget {
  final Car car;

  const CarListTile({required this.car, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${car.carCode} ${car.name}'),
      subtitle: Text('Year: ${car.modelYear}'),
    );
  }
}
