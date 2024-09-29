import 'package:car_rental_app/src/car/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/src/car/presentation/widget/car_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List'),
      ),
      body: BlocConsumer<CarBloc, CarState>(
        listener: (context, state) {
          if (state is CarError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is CarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                final car = state.cars[index];
                return CarListTile(car: car);
              },
            );
          } else if (state is CarError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Press the button to load cars'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CarBloc>().add(const LoadCarsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
