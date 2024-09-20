import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardUtils {
  /// Private constructor
  const DashboardUtils._();

  /// Stream of user data
  static Stream<LocalUserModel> get userDataStream => sl<FirebaseFirestore>()
      .collection('users')
      .doc(sl<LocalUserModel>().uid)
      .snapshots()
      .map((snapshot) => LocalUserModel.fromMap(snapshot.data()!));
}
