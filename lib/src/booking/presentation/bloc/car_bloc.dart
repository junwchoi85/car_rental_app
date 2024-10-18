import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/booking/domain/usecases/get_car_list.dart';
import 'package:car_rental_app/src/booking/domain/usecases/get_vehicle_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({
    // Inject the rep
    required GetCarList getCarList,
    required GetVehicleList getVehicleList,
  })  : _getCarList = getCarList,
        _getVehicleList = getVehicleList,
        super(const CarInitial()) {
    on<LoadCarsEvent>(_loadCarsHandler);
    on<LoadVehiclesEvent>(_loadVehicleHandler);
  }

  final GetCarList _getCarList;
  final GetVehicleList _getVehicleList;

  Future<void> _loadCarsHandler(
    LoadCarsEvent event,
    Emitter<CarState> emit,
  ) async {
    emit(const CarLoading());

    final result = await _getCarList();

    result.fold(
      (failure) => emit(CarError(failure.errorMessage)),
      (cars) => emit(CarLoaded(cars)),
    );
  }

  Future<void> _loadVehicleHandler(
    LoadVehiclesEvent event,
    Emitter<CarState> emit,
  ) async {
    emit(const CarLoading());

    final result = await _getVehicleList();

    result.fold(
      (failure) => emit(CarError(failure.errorMessage)),
      (vehicle) => emit(VehicleLoaded(vehicle)),
    );
  }
}
