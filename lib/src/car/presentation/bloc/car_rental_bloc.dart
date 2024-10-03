import 'package:car_rental_app/src/car/domain/entities/car_rental.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_rental_event.dart';
part 'car_rental_state.dart';

class CarRentalBloc extends Bloc<CarRentalEvent, CarRentalState> {
  CarRentalBloc() : super(const CarRentalInitial()) {
    on<UpdateRentalDetailEvent>(_updateRentalDetailHandler);
  }

  Future<void> _updateRentalDetailHandler(
    UpdateRentalDetailEvent event,
    Emitter<CarRentalState> emit,
  ) async {
    final currentState = state;
    if (currentState is CarRentalDetailsUpdated) {
      final carRental = currentState.carRental;
      emit(
        currentState.copyWith(
          pickUpBranchCode:
              event.pickUpBranchCode ?? carRental.pickUpBranchCode,
          dropOffBranchCode:
              event.dropOffBranchCode ?? carRental.dropOffBranchCode,
          pickUpDate: event.pickUpDate ?? carRental.pickUpDate,
          dropOffDate: event.dropOffDate ?? carRental.dropOffDate,
          pickUpTime: event.pickUpTime ?? carRental.pickUpTime,
          dropOffTime: event.dropOffTime ?? carRental.dropOffTime,
        ),
      );
    }
  }
}
