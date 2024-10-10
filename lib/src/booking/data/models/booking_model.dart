import 'package:car_rental_app/src/booking/domain/entities/booking.dart';

class BookingModel extends Booking {
  const BookingModel({
    required super.pickUpBranch,
    required super.dropOffBranch,
    required super.pickUpDate,
    required super.dropOffDate,
    required super.pickUpTime,
    required super.dropOffTime,
    required super.car,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      pickUpBranch: json['pickUpBranch'],
      dropOffBranch: json[''],
      pickUpDate: json['pickUpDate'],
      dropOffDate: json['dropOffDate'],
      pickUpTime: json['pickUpTime'],
      dropOffTime: json['dropOffTime'],
      car: json['car'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickUpBranch': pickUpBranch,
      'dropOffBranch': dropOffBranch,
      'pickUpDate': pickUpDate,
      'dropOffDate': dropOffDate,
      'pickUpTime': pickUpTime,
      'dropOffTime': dropOffTime,
      'car': car,
    };
  }
}
