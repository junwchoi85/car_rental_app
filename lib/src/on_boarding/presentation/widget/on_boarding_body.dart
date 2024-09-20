import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/src/on_boarding/domain/entities/page_content.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.pageContent});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pageContent.image,
          height: context.height * .4,
        ),
        SizedBox(height: context.height * .03),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.height * .02),
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 50,
              //       vertical: 17,
              //     ),
              //     backgroundColor: context.theme.colorScheme.secondary,
              //     foregroundColor: Colors.white,
              //   ),
              //   onPressed: () {
              //     context.read<OnBoardingCubit>().cacheFirstTimer();
              //   },
              //   child: const Text(
              //     'Get Started',
              //     style: TextStyle(
              //         // fontFamily: Fonts.aeonik,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black),
              //   ),
              // )
            ],
          ),
        )
      ],
    );
  }
}
