import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/authentication/email_register/data/repositories/register_repo.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/exceptions/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:socshea/utils/exceptions/firebase_auth_exception.dart';
import 'package:socshea/utils/exceptions/firebase_exception.dart';
import 'package:socshea/utils/exceptions/format_exception.dart';
import 'package:socshea/utils/exceptions/platform_exception.dart';

class RegisterRepoImpl implements RegisterRepo{
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFireStore;
  RegisterRepoImpl({required this.firebaseFireStore, required this.firebaseAuth});

  @override
  Future<Either<Failure, UserModel>> registerWithEmail({required String firstName, required String lastName, required String username, required String phone, required String email, required String password}) async{
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await firebaseAuth.currentUser?.sendEmailVerification();

      final newUser = UserModel(uID: userCredential.user!.uid, firstName: firstName, lastName: lastName, username: username, phone: phone, email: email, image: TImages.user, isVerified: false);
      await saveUser(userModel: newUser);

      return(Right(newUser));
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
  Future<Either<Failure, void>> saveUser({required UserModel userModel}) async{
    try {
      final firebaseFirestore = await firebaseFireStore.collection("users").doc(userModel.uID).set(userModel.toJson());
      return (Right(firebaseFirestore));
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
  Future<Either<Failure, bool>> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser?.sendEmailVerification();
      return const Right(true);
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
  Future<bool> checkEmailVerification() async {
    await firebaseAuth.currentUser?.reload();
    final currentUser = firebaseAuth.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      await updateUserVerificationStatus(currentUser.uid);
      return true;
    }
    return false;
  }

  @override
  Future<void> signOut() async{
    await firebaseAuth.signOut();
  }

  @override
  Future<void> updateUserVerificationStatus(String uID) async {
    await firebaseFireStore.collection('users').doc(uID).update({
      'isVerified': true,
    });
  }
}