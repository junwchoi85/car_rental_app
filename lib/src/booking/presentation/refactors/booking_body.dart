import 'package:car_rental_app/core/common/enums/service_type.dart';
import 'package:car_rental_app/core/common/widgets/custom_divider.dart';
import 'package:car_rental_app/core/common/widgets/custom_time_picker.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/utils/datetime_utils.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:car_rental_app/src/booking/presentation/view/service_location_view.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({super.key});

  @override
  State<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  final _pickUpLocationController = TextEditingController();
  final _dropOffLocationController = TextEditingController();

  final _pickUpDateController = TextEditingController();
  final _pickUpTimeController = TextEditingController();

  final _dropOffDateController = TextEditingController();
  final _dropOffTimeController = TextEditingController();

  late bool _isDropOffLocationVisible;

  @override
  void initState() {
    super.initState();
    _isDropOffLocationVisible = false;

    _pickUpDateController.text = DatetimeUtils.dateNow();
    _dropOffDateController.text = DatetimeUtils.twoDaysFromNow();
    _pickUpTimeController.text = '12:00 PM';
    _dropOffTimeController.text = '12:00 PM';
  }

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
    final bloc = context.read<BookingBloc>();

    /// Update rental details
    void updateRentalDetails() {
      context.read<BookingBloc>().add(UpdateBookingDetailEvent(
            // pickUpDate: _pickUpDateController.text,
            pickUpTime: _pickUpTimeController.text,
            dropOffDate: _dropOffDateController.text,
            dropOffTime: _dropOffTimeController.text,
          ));
    }

    void resetDropOffLocation() {
      bloc.add(const UpdateBookingDetailEvent(dropOffBranch: Branch.empty()));
    }

    void updatePickupDate(DateTime date) {
      final formatedDate = date.toIso8601String().split('T').first;
      bloc.add(UpdateBookingDetailEvent(pickUpDate: formatedDate));
    }

    void updateDropOffDate(DateTime date) {
      final formatedDate = date.toIso8601String().split('T').first;
      bloc.add(UpdateBookingDetailEvent(dropOffDate: formatedDate));
    }

    void updatePickupTime(TimeOfDay time) {
      final formatedTime = time.format(context);
      bloc.add(UpdateBookingDetailEvent(pickUpTime: formatedTime));
    }

    void updateDropOffTime(TimeOfDay time) {
      final formatedTime = time.format(context);
      bloc.add(UpdateBookingDetailEvent(dropOffTime: formatedTime));
    }

    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BookingDetailsUpdated) {
          _pickUpLocationController.text = state.carRental.pickUpBranch.name;
          _isDropOffLocationVisible =
              state.carRental.dropOffBranch.branchCode.isNotEmpty;
          _dropOffLocationController.text = state.carRental.dropOffBranch.name;
          _pickUpDateController.text =
              DatetimeUtils.parseDate(state.carRental.pickUpDate);
          _pickUpTimeController.text = state.carRental.pickUpTime;
          _dropOffDateController.text =
              DatetimeUtils.parseDate(state.carRental.dropOffDate);
          _dropOffTimeController.text = state.carRental.dropOffTime;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _pickUpLocationController,
                      decoration: const InputDecoration(
                        labelText: 'Pickup Location',
                        hintText: 'Tap to select location',
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () {
                        updateRentalDetails();
                        context.push(
                          const ServiceLocationView(
                            serviceType: ServiceType.pickup,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _isDropOffLocationVisible,
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
                        onTap: () {
                          updateRentalDetails();
                          context.push(
                            const ServiceLocationView(
                              serviceType: ServiceType.dropoff,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !_isDropOffLocationVisible,
                child: GestureDetector(
                  onTap: () {
                    context.push(
                      const ServiceLocationView(
                        serviceType: ServiceType.dropoff,
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.add, color: context.theme.primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Add different drop-off location',
                            style: TextStyle(color: context.theme.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _isDropOffLocationVisible,
                child: GestureDetector(
                  onTap: () {
                    resetDropOffLocation();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(Icons.undo_rounded,
                              color: context.theme.primaryColor),
                          const SizedBox(width: 8),
                          Text(
                            'Return at pickup location',
                            style: TextStyle(color: context.theme.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Pickup',
                                hintText: 'Date',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.today_rounded),
                              ),
                              readOnly: true,
                              controller: _pickUpDateController,
                              onTap: () async {
                                final DateTime? date =
                                    await DatetimeUtils.selectDate(context);
                                updatePickupDate(date!);
                              },
                            ),
                            const CustomDivider(),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Pickup',
                                hintText: 'Time',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.access_time_rounded),
                              ),
                              controller: _pickUpTimeController,
                              readOnly: true,
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return CustomTimePicker(
                                        onTimeSelected: (TimeOfDay time) {
                                      _pickUpTimeController.text =
                                          time.format(context);
                                      updatePickupTime(time);
                                    });
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: double.infinity,
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Drop-Off',
                                hintText: 'Date',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.today_rounded),
                              ),
                              readOnly: true,
                              controller: _dropOffDateController,
                              onTap: () async {
                                final DateTime? date =
                                    await DatetimeUtils.selectDate(context);
                                updateDropOffDate(date!);
                              },
                            ),
                            const CustomDivider(),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Drop-Off',
                                hintText: 'Time',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.access_time_rounded),
                              ),
                              controller: _dropOffTimeController,
                              readOnly: true,
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return CustomTimePicker(
                                        onTimeSelected: (TimeOfDay time) {
                                      _dropOffTimeController.text =
                                          time.format(context);
                                      updateDropOffTime(time);
                                    });
                                  },
                                );
                              },
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
        );
      },
    );
  }
}
