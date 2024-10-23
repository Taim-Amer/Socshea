import 'package:socshea/features/authentication/email_login/data/repositories/login_repo_impl.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/authentication/email_register/data/repositories/register_repo_impl.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo_impl.dart';
import 'package:socshea/features/social/feeds/data/repositories/feeds_repo_impl.dart';
import 'package:socshea/utils/storage/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServiceLocator(){

  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn());

  getIt.registerSingleton<TCacheHelper>(TCacheHelper());

  // getIt.registerSingleton<UserModel>(UserModel(uID: uID, firstName: firstName, lastName: lastName, username: username, phone: phone, email: email, image: image, isVerified: isVerified));

  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(firebaseAuth: getIt.get<FirebaseAuth>()));

  getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(firebaseFireStore: getIt.get<FirebaseFirestore>() ,firebaseAuth: getIt.get<FirebaseAuth>()));

  getIt.registerSingleton<GoogleAuthRepoImpl>(GoogleAuthRepoImpl(googleSignIn: getIt.get<GoogleSignIn>(), firebaseFirestore: getIt.get<FirebaseFirestore>(), firebaseAuth: getIt.get<FirebaseAuth>()));
  
  getIt.registerSingleton<FeedsRepoImpl>(FeedsRepoImpl(userModel: getIt.get<UserModel>(), firebaseFirestore: getIt.get<FirebaseFirestore>()));
}