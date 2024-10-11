import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';

class GoogleAuthRepoImpl implements GoogleAuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  GoogleAuthRepoImpl({
    required this.googleSignIn,
    required this.firebaseFirestore,
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, UserCredential>> googleAuthentication() async {
    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return Left(ServerFailure("Google Sign-In was canceled"));
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        await saveUser(user);
      }

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? "Google Sign-In Error"));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? "Google Sign-In Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> saveUser(User user) async {
    final displayName = user.displayName ?? '';
    final nameParts = displayName.split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts[0] : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    final userModel = UserModel(
      uID: user.uid,
      firstName: firstName,
      lastName: lastName,
      username: user.displayName!,
      phone: user.phoneNumber ?? "0934567890",
      email: user.email ?? "",
    );

    final userDoc = firebaseFirestore.collection("users").doc(userModel.uID);
    final userSnapshot = await userDoc.get();

    if (!userSnapshot.exists) {
      await userDoc.set(userModel.toJson());
    } else {
      await userDoc.update({"lastSignIn": FieldValue.serverTimestamp()});
    }
  }

}
