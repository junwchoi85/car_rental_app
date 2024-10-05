import 'package:car_rental_app/core/common/widgets/gradient_background.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/src/booking/presentation/refactors/booking_body.dart';
import 'package:car_rental_app/src/booking/presentation/widget/booking_app_bar.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: BookingAppBar(),
      body: GradientBackground(
        image: MediaRes.defaultGradientBackground,
        child: BookingBody(),
      ),
    );
  }
}
