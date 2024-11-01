import 'package:car_rental_app/core/common/enums/service_type.dart';
import 'package:car_rental_app/core/utils/datetime_utils.dart';
import 'package:car_rental_app/src/booking/domain/entities/car.dart';
import 'package:car_rental_app/src/booking/domain/entities/vehicle.dart';
import 'package:car_rental_app/src/booking/domain/usecases/book_a_car.dart';
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
    required BookACar bookACar,
  })  : _getServiceLocationList = getServiceLocationList,
        _bookACar = bookACar,
        super(BookingInitial()) {
    // on<BookingEvent>((event, emit) {
    //   emit(const BookingLoading());
    // });
    on<UpdateBookingDetailEvent>(_updateBookingDetailHandler);
    on<LoadServiceLocationsEvent>(_loadServiceLocationsHandler);
    on<SelectServiceLocationEvent>(_serviceLocationSelectedHandler);
    on<CancelServiceLocationEvent>(_cancelServiceLocationHandler);
    on<SelectCarEvent>(_selectCarHandler);
    on<ChooseOptionsEvent>(_chooseOptionsHandler);
    on<ConfirmBookingEvent>(_confirmBookingHandler);
    on<SelectVehicleEvent>(_selectVehicleHandler);
    on<ResetBookingEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(BookingInitial());
    });
  }

  final GetServiceLocationList _getServiceLocationList;
  final BookACar _bookACar;
  late Booking _currentBooking;

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
    if (state is BookingInitial) {
      final currentState = state as BookingInitial;
      _currentBooking = currentState.booking;
    } else {
      _currentBooking = _currentBooking.copyWith(
        pickUpBranch: event.pickUpBranch,
        dropOffBranch: event.dropOffBranch,
        pickUpDate: event.pickUpDate,
        dropOffDate: event.dropOffDate,
        pickUpTime: event.pickUpTime,
        dropOffTime: event.dropOffTime,
      );
    }

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
      emit(BookingDetailsUpdated(_currentBooking));
    }
  }

  Future<void> _cancelServiceLocationHandler(
    CancelServiceLocationEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingDetailsUpdated(_currentBooking));
  }

  Future<void> _selectCarHandler(
    SelectCarEvent event,
    Emitter<BookingState> emit,
  ) async {
    _currentBooking = _currentBooking.copyWith(car: event.car);
    emit(BookingDetailsUpdated(_currentBooking));
  }

  Future<void> _selectVehicleHandler(
    SelectVehicleEvent event,
    Emitter<BookingState> emit,
  ) async {
    _currentBooking = _currentBooking.copyWith(vehicle: event.vehicle);
    emit(BookingDetailsUpdated(_currentBooking));
  }

  Future<void> _chooseOptionsHandler(
    ChooseOptionsEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingDetailsUpdated(_currentBooking));
  }

  Future<void> _confirmBookingHandler(
    ConfirmBookingEvent event,
    Emitter<BookingState> emit,
  ) async {
    final result = await _bookACar(_currentBooking);
    result.fold(
      (failure) => emit(BookingError(failure.errorMessage)),
      (_) => emit(const BookingConfirmed()),
    );
  }
}
