import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:socshea/features/authentication/email_login/data/repositories/login_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';
import 'package:socshea/utils/exceptions/firebase_auth_exception.dart';
import 'package:socshea/utils/exceptions/firebase_exception.dart';
import 'package:socshea/utils/exceptions/format_exception.dart';
import 'package:socshea/utils/exceptions/platform_exception.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth firebaseAuth;
  LoginRepoImpl({required this.firebaseAuth});


  @override
  Future<Either<Failure, UserCredential>> login({required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(TFireBaseAuthException(e.code));
    } on FirebaseException catch (e) {
      return Left(TFireBaseException(e.code));
    } on FormatException catch (e) {
      return Left(TFormatException.fromMessage(e.message));
    } on PlatformException catch (e) {
      return Left(TPlatformException(e.code));
    } catch(e){
      throw "Something went wrong. Please try again.";
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async{
    final resetEmail = await firebaseAuth.sendPasswordResetEmail(email: email);
    return resetEmail;
  }
}