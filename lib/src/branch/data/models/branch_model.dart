import 'package:car_rental_app/src/branch/domain/entities/branch.dart';

class BranchModel extends Branch {
  const BranchModel({
    required super.branchCode,
    required super.name,
    required super.address,
    required super.phone,
    required super.email,
    // required super.status,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      branchCode: json['branchCode'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      // status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branchCode': branchCode,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      // 'status': status,
    };
  }
}
