import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:car_rental_app/core/common/enums/update_user.dart';
import 'package:car_rental_app/src/auth/domain/entities/user.dart';
import 'package:car_rental_app/src/auth/domain/usecases/forgot_password.dart';
import 'package:car_rental_app/src/auth/domain/usecases/sign_in.dart';
import 'package:car_rental_app/src/auth/domain/usecases/sign_up.dart';
import 'package:car_rental_app/src/auth/domain/usecases/update_user.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required ForgotPassword forgotPassword,
    required UpdateUser updateUser,
  })  : _signIn = signIn,
        _signUp = signUp,
        _forgotPassword = forgotPassword,
        _updateUser = updateUser,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final SignIn _signIn;
  final SignUp _signUp;
  final ForgotPassword _forgotPassword;
  final UpdateUser _updateUser;
}
