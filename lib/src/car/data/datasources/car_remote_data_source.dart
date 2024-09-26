import 'package:car_rental_app/src/car/data/models/car_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:car_rental_app/core/errors/exception.dart';

abstract class CarRemoteDataSource {
  /// Fetches the list of cars from the remote API.
  Future<List<CarModel>> getCarList();
}

class CarRemoteDataSourceImpl implements CarRemoteDataSource {
  final http.Client client;

  CarRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CarModel>> getCarList() async {
    final response = await client.get(
      Uri.parse('https://example.com/api/cars'), // 여기에 실제 API 엔드포인트를 입력하세요.
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
}
