import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socshea/utils/exceptions/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> login({required String email, required String password});

  Future<Either<Failure, UserCredential>> registerWithGoogle();
}

