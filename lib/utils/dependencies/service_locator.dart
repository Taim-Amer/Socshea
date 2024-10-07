import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:socshea/features/login/data/repositories/login_repo_impl.dart';
import 'package:socshea/features/signup/data/repositories/register_repo_impl.dart';
import 'package:socshea/utils/api/dio_helper.dart';
import 'package:socshea/utils/storage/cache_helper.dart';

final getIt = GetIt.instance;

void initServiceLocator(){

  getIt.registerSingleton<TCacheHelper>(TCacheHelper());

  getIt.registerSingleton<TDioHelper>(TDioHelper());

  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));

  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));
}