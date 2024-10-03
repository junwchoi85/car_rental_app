import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/branch/data/models/branch_model.dart';
import 'package:car_rental_app/src/branch/presentation/bloc/branch_bloc.dart';
import 'package:car_rental_app/src/branch/presentation/view/search_branch_view.dart';
import 'package:car_rental_app/src/car/presentation/bloc/car_rental_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarHireBody extends StatefulWidget {
  const CarHireBody({super.key});

  @override
  State<CarHireBody> createState() => _CarHireBodyState();
}

class _CarHireBodyState extends State<CarHireBody> {
  final _pickUpLocationController = TextEditingController();

  // final _dropOffLocationController = TextEditingController();
  final _pickUpDateController = TextEditingController();
  final _pickUpTimeController = TextEditingController();

  final _dropOffTimeController = TextEditingController();
  final _dropOffDateController = TextEditingController();

  @override
  void dispose() {
    _pickUpLocationController.dispose();
    _pickUpTimeController.dispose();
    _dropOffTimeController.dispose();
    _pickUpDateController.dispose();
    _dropOffDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final branchModelData = context.tabNavigator.popData;
    final result = branchModelData as BranchModel?;

    /// Select date
    Future<DateTime?> selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      return pickedDate;
    }

    /// Select time
    Future<TimeOfDay?> selectTime(BuildContext context) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      return picked;
    }

    String formatTime(TimeOfDay? time) {
      if (time == null) return 'Select time';
      return time.format(context);
    }

    return BlocProvider(
      create: (_) => sl<CarRentalBloc>(),
      child: BlocConsumer<CarRentalBloc, CarRentalState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CarRentalDetailsUpdated) {
            _pickUpLocationController.text = state.carRental.pickUpBranchCode;
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
                        controller:
                            TextEditingController(text: result?.name ?? ''),
                        decoration: const InputDecoration(
                          hintText: 'Pick-Up Location',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onChanged: (value) => context.read<CarRentalBloc>().add(
                              UpdateRentalDetailEvent(pickUpBranchCode: value),
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => context.push(
                        BlocProvider(
                          create: (_) => sl<BranchBloc>(),
                          child: const SearchBranchView(),
                        ),
                      ),
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
                          final DateTime? date = await selectDate(context);

                          /// Check if the widget is mounted
                          if (!mounted || date == null) return;

                          final dateFormated =
                              date.toIso8601String().split('T').first;
                          // Display the selected date
                          _pickUpDateController.text = dateFormated;

                          context.read<CarRentalBloc>().add(
                              UpdateRentalDetailEvent(
                                  pickUpDate: dateFormated));
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
                          final time = await selectTime(context);
                          if (time != null) {
                            final timeFormated = formatTime(time);
                            _pickUpTimeController.text = timeFormated;
                            context.read<CarRentalBloc>().add(
                                UpdateRentalDetailEvent(
                                    pickUpTime: timeFormated));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Drop Off Date & Time
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
                          final DateTime? date = await selectDate(context);

                          /// Check if the widget is mounted
                          if (!mounted || date == null) return;

                          final dateFormated =
                              date.toIso8601String().split('T').first;
                          // Display the selected date
                          _pickUpDateController.text = dateFormated;

                          context.read<CarRentalBloc>().add(
                              UpdateRentalDetailEvent(
                                  dropOffDate: dateFormated));
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
                        readOnly: true,
                        controller: _dropOffTimeController,
                        onTap: () async {
                          final time = await selectTime(context);
                          if (time != null) {
                            final timeFormated = formatTime(time);
                            _pickUpTimeController.text = timeFormated;
                            context.read<CarRentalBloc>().add(
                                UpdateRentalDetailEvent(
                                    dropOffTime: timeFormated));
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
      ),
    );
  }
}
