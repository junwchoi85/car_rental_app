import 'dart:io';

import 'package:car_rental_app/core/common/enums/update_user.dart';
import 'package:car_rental_app/src/auth/domain/entities/user.dart';
import 'package:car_rental_app/src/auth/domain/usecases/forgot_password.dart';
import 'package:car_rental_app/src/auth/domain/usecases/sign_in.dart';
import 'package:car_rental_app/src/auth/domain/usecases/sign_up.dart';
import 'package:car_rental_app/src/auth/domain/usecases/update_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// Business logic component for authentication.
/// Handles sign in, sign up, forgot password, and user update.
/// Emits [AuthState] in response to [AuthEvent].
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
        super(const AuthInitial()) // Initial state is [AuthInitial]
  {
    /// Listen for incoming events and handle them accordingly.
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInEvent>(_signInHandler);
    on<SignUpEvent>(_signUpHandler);
    on<ForgotPasswordEvent>(_forgotPasswordHandler);
    on<UpdateUserEvent>(_updateUserHandler);
  }

  final SignIn _signIn;
  final SignUp _signUp;
  final ForgotPassword _forgotPassword;
  final UpdateUser _updateUser;

  /// Handles sign in event.
  /// Emits [SignedIn] if sign in is successful.
  /// Emits [AuthError] if sign in fails.
  Future<void> _signInHandler(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signIn(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    /// Fold the result to handle success and failure cases.
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (user) => emit(SignedIn(user)),
    );
  }

  /// Handles sign up event.
  /// Emits [SignedUp] if sign up is successful.
  /// Emits [AuthError] if sign up fails.
  Future<void> _signUpHandler(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signUp(
      SignUpParams(
        email: event.email,
        fullName: event.name,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const SignedUp()),
    );
  }

  /// Handles forgot password event.
  /// Emits [ForgotPasswordSent] if the email is sent successfully.
  /// Emits [AuthError] if the email fails to send.
  Future<void> _forgotPasswordHandler(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _forgotPassword(event.email);
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const ForgotPasswordSent()),
    );
  }

  /// Handles user update event.
  /// Emits [UserUpdated] if the user is updated successfully.
  /// Emits [AuthError] if the user update fails.
  Future<void> _updateUserHandler(
    UpdateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _updateUser(
      UpdateUserParams(
        action: event.action,
        userData: event.userData,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const UserUpdated()),
    );
  }
}
