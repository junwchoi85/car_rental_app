import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/utils/core_utils.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:car_rental_app/src/booking/presentation/refactors/review_details_section.dart';
import 'package:car_rental_app/src/booking/presentation/view/booking_confirmed_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewDetailsView extends StatefulWidget {
  const ReviewDetailsView({super.key});

  @override
  State<ReviewDetailsView> createState() => _ReviewDetailsViewState();
}

class _ReviewDetailsViewState extends State<ReviewDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NestedBackButton(),
        title: const Text('Review Details'),
      ),
      body: Column(
        children: [
          const ReviewDetailsSection(),
          const Spacer(),
          BlocConsumer<BookingBloc, BookingState>(
            listener: (context, state) {
              if (state is BookingConfirmed) {
                context.push(const BookingConfirmedView());
              }
            },
            builder: (context, state) {
              if (state is BookingLoading) {
                const Center(child: CircularProgressIndicator());
              } else if (state is BookingError) {
                // CoreUtils.showSnackBar(context, state.message);
              } else if (state is BookingDetailsUpdated) {
                return Padding(
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
                            .add(const ConfirmBookingEvent());
                      },
                      child: const Text(
                        'Book Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
