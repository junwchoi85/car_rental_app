part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();

  @override
  List<Object> get props => [];
}

class LoadCarsEvent extends CarEvent {
  const LoadCarsEvent();
}

class LoadVehiclesEvent extends CarEvent {
  const LoadVehiclesEvent();
}
