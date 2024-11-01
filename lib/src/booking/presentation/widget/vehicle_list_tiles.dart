import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleListTile extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleListTile({required this.vehicle, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.mediaQuery.size.height;
    final screenWidth = context.mediaQuery.size.width;
    final tileHeight = screenHeight / 3;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: screenWidth,
        height: tileHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Stack(
            children: [
              // 자동차 이미지
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  MediaRes.sampleCar,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  // height: 200,
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                //   bottom: 0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: context.width * .2,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      child: SizedBox(
                        //   color: Colors.grey.withOpacity(.5),
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                              '${vehicle.vehicleName} ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: context.width * .2,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      child: Container(
                        color: Colors.grey.withOpacity(.5),
                        height: 50,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '\$price per day',
                                ),
                                SizedBox(width: 8),
                                Text('${vehicle.pricePerDay}'),
                                const Text(
                                  '|',
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '\$Total Price',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
