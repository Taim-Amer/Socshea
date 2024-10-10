import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socshea/features/login/data/repositories/login_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  LoginRepoImpl(this.googleSignIn, {required this.firebaseAuth});


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

  @override
  Future<Either<Failure, UserCredential>> registerWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(ServerFailure("Google Sign-In was canceled"));
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? "Google Sign-In Error"));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? "Google Sign-In Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}