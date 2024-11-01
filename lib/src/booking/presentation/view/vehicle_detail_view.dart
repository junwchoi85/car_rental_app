import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:car_rental_app/src/booking/presentation/view/choose_coverage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDetailView extends StatelessWidget {
  const VehicleDetailView(this.vehicle, {super.key});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NestedBackButton(),
        title: Text(vehicle.vehicleName),
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
                  vehicle.vehicleName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Price per day: \$${vehicle.pricePerDay}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.primaryColor,
                  foregroundColor: context.theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context
                      .read<BookingBloc>()
                      .add(SelectVehicleEvent(vehicle: vehicle));
                  context.push(
                    BlocProvider.value(
                      value: sl<BookingBloc>(),
                      child: const ChooseCoverageView(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
