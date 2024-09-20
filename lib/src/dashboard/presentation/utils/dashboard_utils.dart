import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardUtils {
  /// Private constructor
  const DashboardUtils._();

  /// Stream of user data
  static Stream<LocalUserModel> get userDataStream => sl<FirebaseFirestore>()
      .collection('users')
      .doc(sl<FirebaseAuth>().currentUser!.uid)
      .snapshots()
      .map((event) => LocalUserModel.fromMap(event.data()!));
}
