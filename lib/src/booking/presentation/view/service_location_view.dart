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
  final formKey = GlobalKey<FormState>();

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
      context.read<BookingBloc>().add(
            SelectServiceLocationEvent(
              serviceLocation: _serviceLocationController.text,
              serviceType: widget.serviceType,
            ),
          );
    }

    void cancelSelection() {
      context.read<BookingBloc>().add(const CancelServiceLocationEvent());
      context.pop();
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
                  cancelSelection();
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
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: _serviceLocationController,
                    decoration: InputDecoration(
                      labelText:
                          'Select a ${widget.serviceType.value} location',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select a ${widget.serviceType.value} location';
                      }
                    },
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        updateServiceLocation();
                        context.pop();
                      }
                    },
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
