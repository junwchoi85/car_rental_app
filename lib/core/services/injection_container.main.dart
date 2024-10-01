part of 'injection_container.dart';

/// Service locator
final sl = GetIt.instance;

/// Initialize the service locator
Future<void> init() async {
  await _onBoardingInit();
  await _initAuth();
  await _initHttp();
  await _initCarListing();
  await _initBranchListing();
}

Future<void> _onBoardingInit() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        firstTimeUserCheck: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => FirstTimeUserCheck(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(sharedPreferences: sl()),
    )
    ..registerLazySingleton(() => sharedPreferences);
}

Future<void> _initHttp() async {
  sl.registerLazySingleton(() => http.Client());
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(
      () => AuthBloc(
        signIn: sl(),
        signUp: sl(),
        forgotPassword: sl(),
        updateUser: sl(),
      ),
    )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initCarListing() async {
  sl
    ..registerFactory(
      () => CarBloc(
        getCarList: sl(),
      ),
    )
    ..registerLazySingleton(() => GetCarList(sl()))
    ..registerLazySingleton<CarRepository>(() => CarRepositoryImpl(sl()))
    ..registerLazySingleton<CarRemoteDataSource>(
      () => CarRemoteDataSourceImpl(
        client: sl(),
      ),
    );
}

Future<void> _initBranchListing() async {
  sl
    ..registerFactory(
      () => BranchBloc(
        getBranchList: sl(),
      ),
    )
    ..registerLazySingleton(() => GetBranchList(sl()))
    ..registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(sl()))
    ..registerLazySingleton<BranchRemoteDataSource>(
      () => BranchRemoteDataSourceImpl(),
    );
}
