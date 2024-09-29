import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/src/car/domain/entities/car.dart';
import 'package:flutter/material.dart';

class CarListTile extends StatelessWidget {
  final Car car;

  const CarListTile({required this.car, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // 왼쪽: 자동차 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${car.name} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Year: ${car.modelYear}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Price per day:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // 오른쪽: 자동차 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                MediaRes.sampleCar,
                fit: BoxFit.cover,
                width: 100, // Set a fixed width to prevent overflow
                height: 100, // Set a fixed height to maintain aspect ratio
              ),
            ),
          ],
        ),
      ),
    );
  }
}
