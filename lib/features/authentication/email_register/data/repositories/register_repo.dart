import 'package:dartz/dartz.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/utils/exceptions/failures.dart';

abstract class RegisterRepo{
  Future<Either<Failure, UserModel>> registerWithEmail({required String firstName, required String lastName, required String username, required String phone,required String email, required String password});

  Future<Either<Failure, void>> saveUser({required UserModel userModel});

  Future<Either<Failure, bool>> sendEmailVerification();

  Future<void> updateUserVerificationStatus(String uID);

  Future<bool> checkEmailVerification();

  Future<void> signOut();
}