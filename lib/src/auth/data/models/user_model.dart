import 'package:car_rental_app/core/utils/typedefs.dart';
import 'package:car_rental_app/src/auth/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.uid,
    required super.email,
    required super.points,
    required super.fullName,
    super.profilePic,
  });

  const LocalUserModel.empty()
      : super(
          uid: '',
          email: '',
          profilePic: null,
          points: 0,
          fullName: '',
        );

  LocalUserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'],
          email: map['email'],
          profilePic: map['profilePic'],
          points: map['points'],
          fullName: map['fullName'],
        );

  LocalUserModel copyWith({
    String? uid,
    String? email,
    String? profilePic,
    int? points,
    String? fullName,
  }) {
    return LocalUserModel(
      uid: uid ?? super.uid,
      email: email ?? super.email,
      profilePic: profilePic ?? super.profilePic,
      points: points ?? super.points,
      fullName: fullName ?? super.fullName,
    );
  }

  DataMap toMap() {
    return {
      'uid': super.uid,
      'email': super.email,
      'profilePic': super.profilePic,
      'points': super.points,
      'fullName': super.fullName,
    };
  }
}
