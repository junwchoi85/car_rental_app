import 'dart:convert';

import 'package:car_rental_app/core/errors/exception.dart';
import 'package:car_rental_app/core/utils/api_constants.dart';
import 'package:car_rental_app/core/utils/datasource_utils.dart';
import 'package:car_rental_app/src/booking/data/models/car_model.dart';
import 'package:car_rental_app/src/booking/data/models/vehicle_model.dart';
import 'package:car_rental_app/src/booking/domain/entities/booking.dart';
import 'package:car_rental_app/src/branch/data/models/branch_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class BookingRemoteDataSource {
  /// Fetches the list of cars from the remote API.
  Future<List<CarModel>> getCarList();
  Future<List<VehicleModel>> getVehicleList();
  Future<List<BranchModel>> getBranchList();
  Future<void> bookCar({required Booking booking});
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  BookingRemoteDataSourceImpl({
    required this.client,
    required FirebaseAuth auth,
  }) : _auth = auth;

  final http.Client client;
  final FirebaseAuth _auth;

  @override
  Future<List<CarModel>> getCarList() async {
    final response = await client.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.carList),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        message: 'Failed to load cars',
        statusCode: response.statusCode.toString(),
      );
    }
  }

  @override
  Future<List<VehicleModel>> getVehicleList() async {
    final response = await client.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.vehicleList),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => VehicleModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        message: 'Failed to load vehicles',
        statusCode: response.statusCode.toString(),
      );
    }
  }

  @override
  Future<List<BranchModel>> getBranchList() {
    const supportEmail = 'support@classiccrew.io';
    final List<BranchModel> branchList = [
      const BranchModel(
        branchCode: 'B001',
        name: 'Auckland Airport',
        address: 'Andrew Mckee Avenue, Auckland Airport, Auckland 2022',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B002',
        name: 'Auckland Downtown',
        address: '154 Victoria Street West, Auckland Central, Auckland 1010',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B003',
        name: 'Auckland East',
        address: '61 A Feltom Street, Glen Innes, Auckland 1072',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B004',
        name: 'Auckland Northshore',
        address: '37 Northcote Road, Northcote, Auckland 0627',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B005',
        name: 'Auckland South',
        address: '1/1 Great South Road, Otahuhu, Auckland 1062',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B006',
        name: 'Auckland West',
        address: '1/1 Hobsonville Road, Hobsonville, Auckland 0618',
        phone: '00 000 0000',
        email: supportEmail,
      ),
      const BranchModel(
        branchCode: 'B007',
        name: 'Auckland West',
        address: '1/1 Hobsonville Road, Hobsonville, Auckland 0618',
        phone: '00 000 0000',
        email: supportEmail,
      ),
    ];

    return Future.value(branchList);
  }

  @override
  Future<void> bookCar({required Booking booking}) async {
    try {
      await DataSourceUtils.authorizeUser(_auth);
      final user = _auth.currentUser!;

      final response = await client.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.bookCar),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'pickUpBranch': booking.pickUpBranch.branchCode,
            'dropOffBranch': booking.dropOffBranch.branchCode,
            'pickUpDate': booking.pickUpDate,
            'dropOffDate': booking.dropOffDate,
            'pickUpTime': booking.pickUpTime,
            'dropOffTime': booking.dropOffTime,
            // 'carCode': booking.car.carCode,
            'userEmail': user.email,
            'vehicleCode': booking.vehicle.vehicleCode,
          },
        ),
      );

      if (response.statusCode == 200) {
        // TODO: Implement the response handling
        return;
      } else {
        throw ServerException(
          message: 'Failed to book car',
          statusCode: response.statusCode.toString(),
        );
      }
    } on FirebaseException catch (e) {
      throw ServerException(
        message: e.message ?? 'Unknown error',
        statusCode: e.code,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
        statusCode: '500',
      );
    }
  }
}
