import 'package:car_rental_app/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  const OnBoardingLocalDataSource();

  Future<void> cacheFirstTimer();
  Future<bool> checkIfUserIsFirstTimer();
}

const kFirstTimerKey = 'first_timer';

class OnBoardingLocalDataSourceImpl extends OnBoardingLocalDataSource {
  const OnBoardingLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _sharedPreferences.setBool(kFirstTimerKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      return _sharedPreferences.getBool(kFirstTimerKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
