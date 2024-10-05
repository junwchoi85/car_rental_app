import 'package:car_rental_app/src/branch/domain/entities/branch.dart';
import 'package:car_rental_app/src/booking/domain/entities/booking.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class CarRentalBloc extends Bloc<BookingEvent, BookingState> {
  CarRentalBloc() : super(const BookingInitial()) {
    on<UpdateBookingDetailEvent>(_updateRentalDetailHandler);
  }

  Future<void> _updateRentalDetailHandler(
    UpdateBookingDetailEvent event,
    Emitter<BookingState> emit,
  ) async {
    final carRental = Booking(
      pickUpBranch: event.pickUpBranch ??
          const Branch(
            branchCode: '',
            name: '',
            address: '',
            phone: '',
            email: '',
          ),
      dropOffBranch: event.dropOffBranch ??
          const Branch(
            branchCode: '',
            name: '',
            address: '',
            phone: '',
            email: '',
          ),
      pickUpDate: event.pickUpDate ?? '',
      dropOffDate: event.dropOffDate ?? '',
      pickUpTime: event.pickUpTime ?? '',
      dropOffTime: event.dropOffTime ?? '',
    );
    emit(BookingDetailsUpdated(carRental));
  }
}
