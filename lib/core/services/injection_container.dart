import 'package:car_rental_app/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:car_rental_app/src/auth/data/repositories/auth_repo_impl.dart';
import 'package:car_rental_app/src/auth/domain/repositories/auth_repo.dart';
import 'package:car_rental_app/src/auth/domain/usecases/forgot_password.dart';
import 'package:car_rental_app/src/auth/domain/usecases/sign_in.dart';
import 'package:car_rental_app/src/auth/domain/usecases/sign_up.dart';
import 'package:car_rental_app/src/auth/domain/usecases/update_user.dart';
import 'package:car_rental_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_rental_app/src/car/data/datasources/car_remote_data_source.dart';
import 'package:car_rental_app/src/car/data/repositories/car_repo_impl.dart';
import 'package:car_rental_app/src/car/domain/repositories/car_repository.dart';
import 'package:car_rental_app/src/car/domain/usecases/get_car_list.dart';
import 'package:car_rental_app/src/car/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:car_rental_app/src/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:car_rental_app/src/on_boarding/domain/repositories/on_boarding_repo.dart';
import 'package:car_rental_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:car_rental_app/src/on_boarding/domain/usecases/first_time_user_check.dart';
import 'package:car_rental_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'injection_container.main.dart';
