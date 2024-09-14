import 'package:bloc/bloc.dart';
import 'package:car_rental_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:car_rental_app/src/on_boarding/domain/usecases/first_time_user_check.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required FirstTimeUserCheck firstTimeUserCheck,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _firstTimeUserCheck = firstTimeUserCheck,
        super(const OnBoardingInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final FirstTimeUserCheck _firstTimeUserCheck;

  Future<void> cacheFirstTimer() async {
    emit(const CachingFirstTimer());
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(OnBoardingError(failure.errorMessage)),
      (_) => emit(const UserCached()),
    );
  }

  Future<void> checkIfUserIsFirstTimer() async {
    emit(const CheckingIfUserIsFirstTimer());
    final result = await _firstTimeUserCheck();

    result.fold(
      (failure) => emit(const OnBoardingStatus(isFirstTimer: true)),
      (status) => emit(OnBoardingStatus(isFirstTimer: status)),
    );
  }
}
