import 'package:car_rental_app/core/common/enums/service_type.dart';
import 'package:car_rental_app/src/booking/domain/usecases/get_service_location_list.dart';
import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/booking/domain/entities/booking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc({
    required GetServiceLocationList getServiceLocationList,
  })  : _getServiceLocationList = getServiceLocationList,
        super(const BookingInitial()) {
    on<UpdateBookingDetailEvent>(_updateBookingDetailHandler);
    on<LoadServiceLocationsEvent>(_loadServiceLocationsHandler);
    on<SelectServiceLocationEvent>(_serviceLocationSelectedHandler);
  }

  final GetServiceLocationList _getServiceLocationList;
  Booking _currentBooking = const Booking.empty();

  Future<void> _loadServiceLocationsHandler(
    LoadServiceLocationsEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(const ServiceLocationsLoading());

    final result = await _getServiceLocationList();

    result.fold(
      (failure) => emit(ServiceLocationsError(failure.errorMessage)),
      (branches) => emit(ServiceLocationsLoaded(branches)),
    );
  }

  Future<void> _updateBookingDetailHandler(
    UpdateBookingDetailEvent event,
    Emitter<BookingState> emit,
  ) async {
    _currentBooking = _currentBooking.copyWith(
      pickUpBranch: event.pickUpBranch,
      dropOffBranch: event.dropOffBranch,
      pickUpDate: event.pickUpDate,
      dropOffDate: event.dropOffDate,
      pickUpTime: event.pickUpTime,
      dropOffTime: event.dropOffTime,
    );
    emit(BookingDetailsUpdated(_currentBooking));
  }

  Future<void> _serviceLocationSelectedHandler(
    SelectServiceLocationEvent event,
    Emitter<BookingState> emit,
  ) async {
    final currentState = state;
    if (currentState is ServiceLocationsLoaded) {
      final selectedBranch = currentState.branches.firstWhere(
        (branch) => branch.name == event.serviceLocation,
      );
      if (event.serviceType == ServiceType.pickup) {
        _currentBooking =
            _currentBooking.copyWith(pickUpBranch: selectedBranch);
      } else {
        _currentBooking =
            _currentBooking.copyWith(dropOffBranch: selectedBranch);
      }
      emit(ServiceLocationSelected(selectedBranch));
    }
  }
}
