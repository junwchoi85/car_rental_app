import 'package:car_rental_app/core/common/widgets/gradient_background.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/src/booking/presentation/refactors/booking_body.dart';
import 'package:car_rental_app/src/booking/presentation/view/vehicle_list_screen.dart';
import 'package:car_rental_app/src/booking/presentation/widget/booking_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const BookingAppBar(),
      body: GradientBackground(
        image: MediaRes.defaultGradientBackground,
        child: Column(
          children: [
            Image.asset(MediaRes.travel),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'HIRE A CAR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            BookingBody(
              formKey: formKey,
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
                    if (formKey.currentState!.validate()) {
                      context.push(
                        BlocProvider(
                          create: (_) => sl<CarBloc>(),
                          // child: const CarListScreen(),
                          child: const VehicleListScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'View Available Cars',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
