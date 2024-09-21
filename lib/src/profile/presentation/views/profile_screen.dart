import 'package:car_rental_app/core/common/widgets/gradient_background.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/src/profile/presentation/widgets/profile_app_bar.dart';
import 'package:car_rental_app/src/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: const ProfileAppBar(),
      body: GradientBackground(
        image: MediaRes.defaultGradientBackground,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            ProfileHeader(),
            if(user?)
          ],
        ),
      ),
    );
  }
}
