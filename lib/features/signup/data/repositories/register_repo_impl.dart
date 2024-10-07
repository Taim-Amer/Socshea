import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socshea/features/register/data/repositories/register_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';

class RegisterRepoImpl implements RegisterRepo{
  final FirebaseAuth firebaseAuth;
  RegisterRepoImpl({required this.firebaseAuth});

  @override
  Future<Either<Failure, UserCredential>> register({required String email, required String password}) async{
    try {
      final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // final RegisterModel registerModel = RegisterModel.fromJson(userCredential);
      return(Right(userCredential));
    } on FirebaseAuthException catch (e) {
      // return Left(ServerFailure(e.message ?? "Authentication Error"));
      return Left(ServerFailure(e.message ?? "Authentication Error"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}