import 'package:car_rental_app/core/common/enums/service_type.dart';
import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceLocationView extends StatefulWidget {
  const ServiceLocationView({
    super.key,
    required this.serviceType,
    this.initialBranch,
  });

  final ServiceType serviceType;
  final String? initialBranch;

  @override
  State<ServiceLocationView> createState() => _ServiceLocationViewState();
}

class _ServiceLocationViewState extends State<ServiceLocationView> {
  final List<String> _allItems = [];
  List<String> _filteredItems = [];
  final _serviceLocationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(const LoadServiceLocationsEvent());
  }

  @override
  void dispose() {
    _serviceLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void updateServiceLocation() {
      final state =
          context.read<BookingBloc>().state as ServiceLocationSelected;
      final branch = state.selectedBranch;

      final bookingEvent = widget.serviceType == ServiceType.pickup
          ? UpdateBookingDetailEvent(pickUpBranch: branch)
          : UpdateBookingDetailEvent(dropOffBranch: branch);

      context.read<BookingBloc>().add(bookingEvent);
    }

    void selectServiceLocation(String serviceLocation) {
      // final serviceLocation =
      //     (context.read<BookingBloc>().state as ServiceLocationsLoaded)
      //         .branches
      //         .firstWhere((branch) => branch.name == locationName);
      context.read<BookingBloc>().add(SelectServiceLocationEvent(
            serviceLocation: serviceLocation,
            serviceType: widget.serviceType,
          ));
    }

    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is ServiceLocationsLoaded) {
          setState(() {
            _allItems.clear();
            _allItems.addAll(state.branches.map((branch) => branch.name));
            _filteredItems = _allItems
                .where((item) => item
                    .toLowerCase()
                    .contains(_serviceLocationController.text.toLowerCase()))
                .toList();
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const NestedBackButton(),
            title: const Text('Branch Location'),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('cancel'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search TextField
                TextField(
                  controller: _serviceLocationController,
                  decoration: InputDecoration(
                    labelText: 'Select a ${widget.serviceType.value} location',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Dropdown-like display of filtered results
                _filteredItems.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _filteredItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_filteredItems[index]),
                              onTap: () {
                                _serviceLocationController.text =
                                    _filteredItems[index];
                                selectServiceLocation(_filteredItems[index]);
                                // Optionally clear the search results
                                // setState(() {
                                //   _filteredItems.clear();
                                // });
                              },
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child:
                            Container()), // Show nothing if no matching items
                // add a button at the bottom to select the selected branch
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.primaryColor,
                      foregroundColor: context.theme.colorScheme.onPrimary,
                    ),
                    onPressed: _serviceLocationController.text.isNotEmpty
                        ? () {
                            updateServiceLocation();
                            context.pop();
                          }
                        : null,
                    child: const Text('Select Branch'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
