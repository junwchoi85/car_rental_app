import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/utils/datetime_utils.dart';
import 'package:car_rental_app/src/branch/presentation/view/search_branch_screen.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarHireBody extends StatefulWidget {
  const CarHireBody({super.key});

  @override
  State<CarHireBody> createState() => _CarHireBodyState();
}

class _CarHireBodyState extends State<CarHireBody> {
  final _pickUpLocationController = TextEditingController();
  final _dropOffLocationController = TextEditingController();

  final _pickUpDateController = TextEditingController();
  final _pickUpTimeController = TextEditingController();

  final _dropOffTimeController = TextEditingController();
  final _dropOffDateController = TextEditingController();

  @override
  void dispose() {
    _pickUpLocationController.dispose();
    _dropOffLocationController.dispose();
    _pickUpTimeController.dispose();
    _pickUpDateController.dispose();
    _dropOffTimeController.dispose();
    _dropOffDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Update rental details
    void updateRentalDetails() {
      context.read<BookingBloc>().add(UpdateBookingDetailEvent(
            pickUpDate: _pickUpDateController.text,
            pickUpTime: _pickUpTimeController.text,
            dropOffDate: _dropOffDateController.text,
            dropOffTime: _dropOffTimeController.text,
          ));
    }

    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BookingDetailsUpdated) {
          _pickUpDateController.text = state.carRental.pickUpDate;
          _pickUpTimeController.text = state.carRental.pickUpTime;
          _dropOffDateController.text = state.carRental.dropOffDate;
          _dropOffTimeController.text = state.carRental.dropOffTime;
        }
        return Column(
          children: [
            Image.asset(MediaRes.travel),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hire a car.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _pickUpLocationController,
                      decoration: const InputDecoration(
                        hintText: 'Pickup Location',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      updateRentalDetails();
                      context.push(const SearchBranchScreen(
                        serviceType: 'Pickup',
                      ));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dropOffLocationController,
                      decoration: const InputDecoration(
                        hintText: 'Drop-off Location',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      updateRentalDetails();

                      context.push(
                          const SearchBranchScreen(serviceType: 'Drop-Off'));
                    },
                  ),
                ],
              ),
            ),

            /// Pick-Up Date & Time
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Pick-Up Date',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      controller: _pickUpDateController,
                      onTap: () async {
                        final DateTime? date =
                            await DatetimeUtils.selectDate(context);

                        /// Check if the widget is mounted
                        if (!mounted || date == null) return;

                        // Display the selected date
                        _pickUpDateController.text =
                            DatetimeUtils.formatDate(context, date);
                        updateRentalDetails();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Pick-Up Time',
                        border: OutlineInputBorder(),
                      ),
                      controller: _pickUpTimeController,
                      readOnly: true,
                      onTap: () async {
                        final time = await DatetimeUtils.selectTime(context);
                        if (time != null) {
                          _pickUpTimeController.text =
                              DatetimeUtils.formatTime(context, time);
                          updateRentalDetails();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Drop-Off Date & Time
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Drop-Off Date',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      controller: _dropOffDateController,
                      onTap: () async {
                        final DateTime? date =
                            await DatetimeUtils.selectDate(context);

                        /// Check if the widget is mounted
                        if (!mounted || date == null) return;

                        // Display the selected date
                        _dropOffDateController.text =
                            DatetimeUtils.formatDate(context, date);
                        updateRentalDetails();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Drop-Off Time',
                        border: OutlineInputBorder(),
                      ),
                      controller: _dropOffTimeController,
                      readOnly: true,
                      onTap: () async {
                        final time = await DatetimeUtils.selectTime(context);
                        if (time != null) {
                          _dropOffTimeController.text =
                              DatetimeUtils.formatTime(context, time);
                          updateRentalDetails();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.primaryColor,
                    foregroundColor: context.theme.colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    // Handle button press
                  },
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
