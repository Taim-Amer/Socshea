import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socshea/features/authentication/email_login/data/repositories/login_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';

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
      return Left(ServerFailure(e.message ?? "Authentication Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}