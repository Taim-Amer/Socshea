import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socshea/features/login/data/repositories/login_repo_impl.dart';
import 'package:socshea/features/register/data/repositories/register_repo_impl.dart';
import 'package:socshea/utils/storage/cache_helper.dart';

final getIt = GetIt.instance;

void initServiceLocator(){

  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn());

  getIt.registerSingleton<TCacheHelper>(TCacheHelper());

  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(getIt.get<GoogleSignIn>() ,firebaseAuth: getIt.get<FirebaseAuth>()));

  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));
}