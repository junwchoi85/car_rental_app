import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewDetailsSection extends StatelessWidget {
  const ReviewDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: BlocConsumer<BookingBloc, BookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is BookingDetailsUpdated) {
            final rentalDetails = state.carRental;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                child: Text(
                                  rentalDetails.car.name,
                                  // style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Column(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 21),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'PICKUP',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 18, // Adjust the size as needed
                                      ),
                                      const SizedBox(width: 4),
                                      Text(rentalDetails.pickUpBranch.name),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text(rentalDetails.pickUpDate),
                                          const Text(', '),
                                          Text(
                                            rentalDetails.pickUpTime,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 21),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'DROP-OFF',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 18, // Adjust the size as needed
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        rentalDetails
                                                .dropOffBranch.name.isNotEmpty
                                            ? rentalDetails.dropOffBranch.name
                                            : rentalDetails.pickUpBranch.name,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text(rentalDetails.dropOffDate),
                                          const Text(', '),
                                          Text(
                                            rentalDetails.dropOffTime,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BookingInitial) {
            return const Center(
              child: Text('WHY?'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
