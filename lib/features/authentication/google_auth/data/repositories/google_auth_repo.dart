import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/utils/exceptions/failures.dart';

abstract class GoogleAuthRepo{
  // Future<Either<Failure, UserCredential>> googleAuthentication();

  Future<Either<Failure, GoogleSignInAccount>> selectGoogleAccount();

  Future<Either<Failure, UserModel>> authenticateWithGoogle(GoogleSignInAccount googleUser);

  Future<void> saveUser(User user);
}