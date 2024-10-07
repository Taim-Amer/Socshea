import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socshea/utils/exceptions/failures.dart';
import 'package:socshea/features/register/data/models/register_model.dart';

abstract class RegisterRepo{
  Future<Either<Failure, UserCredential>> register({required String email, required String password});
}