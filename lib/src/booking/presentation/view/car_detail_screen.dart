import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen(this.car, {super.key});

  static const routeName = '/car_detail';

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: Column(
        children: [
          // 자동차 이미지
          Image.asset(
            MediaRes.sampleCar,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          // 자동차 정보
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Year: ${car.modelYear}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  // 'Price per day: \$${car.pricePerDay}',
                  'Price per day:',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
