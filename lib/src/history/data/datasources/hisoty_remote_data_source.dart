import 'dart:convert';

import 'package:car_rental_app/core/errors/exception.dart';
import 'package:car_rental_app/core/utils/api_constants.dart';
import 'package:car_rental_app/core/utils/datasource_utils.dart';
import 'package:car_rental_app/src/history/data/models/history_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class HistoryRemoteDataSource {
  Future<List<HistoryModel>> getHistoryList();
}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  HistoryRemoteDataSourceImpl({
    required this.client,
    required FirebaseAuth auth,
  }) : _auth = auth;

  final http.Client client;
  final FirebaseAuth _auth;

  @override
  Future<List<HistoryModel>> getHistoryList() async {
    await DataSourceUtils.authorizeUser(_auth);
    final user = _auth.currentUser!;

    final queryParameters = {
      'email': user.email,
    };
    final uri = Uri.parse(ApiConstants.baseUrl + ApiConstants.history)
        .replace(queryParameters: queryParameters);

    final response = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => HistoryModel.fromJson(json)).toList();
    } else {
      throw ServerException(
        message: 'Failed to load history',
        statusCode: response.statusCode.toString(),
      );
    }
  }
}
