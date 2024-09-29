import 'package:car_rental_app/src/car/domain/entities/car.dart';
import 'package:car_rental_app/src/car/domain/usecases/get_car_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({
    // Inject the rep
    required GetCarList getCarList,
  })  : _getCarList = getCarList,
        super(const CarInitial()) {
    on<LoadCarsEvent>(_loadCarsHandler);
  }

  final GetCarList _getCarList;

  Future<void> _loadCarsHandler(
      LoadCarsEvent event, Emitter<CarState> emit) async {
    emit(const CarLoading());

    final result = await _getCarList();

    result.fold(
      (failure) => emit(CarError(failure.errorMessage)),
      (cars) => emit(CarLoaded(cars)),
    );
  }
}
