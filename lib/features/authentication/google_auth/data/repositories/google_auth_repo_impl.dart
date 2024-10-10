import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';

class GoogleAuthRepoImpl implements GoogleAuthRepo{
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  GoogleAuthRepoImpl(this.googleSignIn, {required this.firebaseAuth});

  @override
  Future<Either<Failure, UserCredential>> googleAuthentication() async{
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