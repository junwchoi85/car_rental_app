import 'package:equatable/equatable.dart';

class Branch extends Equatable {
  const Branch.empty()
      : branchCode = '',
        name = '',
        address = '',
        phone = '',
        email = '';

  const Branch({
    required this.branchCode,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    // required this.status,
  });

  final String branchCode;
  final String name;
  final String address;
  final String phone;
  final String email;
  // final String status;

  @override
  List<Object?> get props => [
        branchCode,
        name,
        address,
        phone,
        email,
        // status,
      ];
}
