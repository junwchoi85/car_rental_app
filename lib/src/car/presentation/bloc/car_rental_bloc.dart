import 'package:car_rental_app/src/car/domain/entities/car_rental.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_rental_event.dart';
part 'car_rental_state.dart';

class CarRentalBloc extends Bloc<CarRentalEvent, CarRentalState> {
  CarRentalBloc() : super(const CarRentalInitial()) {
    on<UpdatePickUpBranchEvent>(_updatePickUpBranchHandler);
    on<UpdateDropOffBranchEvent>(_updateDropOffBranchHandler);
    on<UpdatePickUpDateEvent>(_updatePickUpDateHandler);
    on<UpdateDropOffDateEvent>(_updateDropOffDateHandler);
    on<UpdatePickUpTimeEvent>(_updatePickUpTimeHandler);
    on<UpdateDropOffTimeEvent>(_updateDropOffTimeHandler);
  }

  Future<void> _updatePickUpBranchHandler(
    UpdatePickUpBranchEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    emit(
      (state as CarRentalDetailsUpdated)
          .copyWith(pickUpBranchCode: event.pickUpBranchCode),
    );
  }

  Future<void> _updateDropOffBranchHandler(
    UpdateDropOffBranchEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    emit(
      (state as CarRentalDetailsUpdated)
          .copyWith(dropOffBranchCode: event.dropOffBranchCode),
    );
  }

  Future<void> _updatePickUpDateHandler(
    UpdatePickUpDateEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    emit(
      (state as CarRentalDetailsUpdated).copyWith(pickUpDate: event.pickUpDate),
    );
  }

  Future<void> _updateDropOffDateHandler(
    UpdateDropOffDateEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    emit(
      (state as CarRentalDetailsUpdated)
          .copyWith(dropOffDate: event.dropOffDate),
    );
  }

  Future<void> _updatePickUpTimeHandler(
    UpdatePickUpTimeEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    emit(
      (state as CarRentalDetailsUpdated).copyWith(pickUpTime: event.pickUpTime),
    );
  }

  Future<void> _updateDropOffTimeHandler(
    UpdateDropOffTimeEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    emit(
      (state as CarRentalDetailsUpdated)
          .copyWith(dropOffTime: event.dropOffTime),
    );
  }
}
