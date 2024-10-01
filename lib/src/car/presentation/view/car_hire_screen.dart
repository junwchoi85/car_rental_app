import 'package:car_rental_app/core/common/widgets/gradient_background.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/src/car/presentation/refactors/car_hire_body.dart';
import 'package:car_rental_app/src/car/presentation/widget/car_hire_app_bar.dart';
import 'package:flutter/material.dart';

class CarHireScreen extends StatelessWidget {
  const CarHireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CarHireAppBar(),
      body: GradientBackground(
        image: MediaRes.defaultGradientBackground,
        child: CarHireBody(),
      ),
    );
  }
}
