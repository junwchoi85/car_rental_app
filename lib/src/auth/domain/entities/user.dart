import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.points,
    required this.fullName,
    this.profilePic,
  });

  const LocalUser.empty()
      : uid = '',
        email = '',
        profilePic = '',
        points = 0,
        fullName = '';

  final String uid;
  final String email;
  final int points;
  final String fullName;
  final String? profilePic;

  @override
  List<Object?> get props => [uid, email, profilePic, fullName];

  @override
  String toString() {
    return 'LocalUser(uid: $uid, email: $email, profilePic: $profilePic, '
        'points: $points, fullName: $fullName)';
  }
}
