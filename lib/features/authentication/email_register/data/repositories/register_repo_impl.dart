import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/authentication/email_register/data/repositories/register_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';
import 'package:dartz/dartz.dart';

class RegisterRepoImpl implements RegisterRepo{
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFireStore;
  RegisterRepoImpl({required this.firebaseFireStore, required this.firebaseAuth});

  @override
  Future<Either<Failure, UserCredential>> registerWithEmail({required String firstName, required String lastName, required String username, required String phone, required String email, required String password}) async{
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await sendEmailVerification();

      final newUser = UserModel(uID: userCredential.user!.uid, firstName: firstName, lastName: lastName, username: username, phone: phone, email: email);
      await saveUser(userModel: newUser);
      
      return(Right(userCredential));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? "Authentication Error"));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? "Authentication Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser({required UserModel userModel}) async{
    try {
      final firebaseFirestore = await firebaseFireStore.collection("users").doc(userModel.uID).set(userModel.toJson());
      return (Right(firebaseFirestore));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? "Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async{
    try{
      final verified = await firebaseAuth.currentUser?.sendEmailVerification();
      return Right(verified);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? "Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> checkEmailVerification() async{
    await firebaseAuth.currentUser?.reload();
    final currentUser = firebaseAuth.currentUser;
    if(currentUser != null && currentUser.emailVerified) return true;
    return false;
  }

  @override
  Future<void> signOut() async{
    await firebaseAuth.signOut();
  }
}