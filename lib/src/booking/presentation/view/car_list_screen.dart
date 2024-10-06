import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/common/widgets/not_found_text.dart';
import 'package:car_rental_app/src/booking/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/src/booking/presentation/view/car_detail_screen.dart';
import 'package:car_rental_app/src/booking/presentation/widget/car_list_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면이 빌드될 때 이벤트를 바로 디스패치
    context.read<CarBloc>().add(const LoadCarsEvent());

    return Scaffold(
      appBar: AppBar(
        leading: const NestedBackButton(),
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
          } else if ((state is CarLoaded && state.cars.isEmpty) ||
              state is CarError) {
            return const NotFoundText('No cars available.');
          } else if (state is CarLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CarBloc>().add(const LoadCarsEvent());
              },
              child: ListView.builder(
                itemCount: state.cars.length,
                itemBuilder: (context, index) {
                  final car = state.cars[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(CarDetailScreen.routeName, arguments: car);
                    },
                    child: CarListTile(car: car),
                  );
                },
              ),
            );
          } else if (state is CarError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No cars available.'));
          }
        },
      ),
    );
  }
}
