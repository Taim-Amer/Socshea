import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socshea/features/login/data/repositories/login_repo.dart';
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

// class LoginRepoImpl implements LoginRepo {
//   final ApiService apiService;
//   LoginRepoImpl({required this.apiService});
//
//   @override
//   Future<Either<Failure, LoginModel>> login(
//       {required String email, required String password}) async {
//     try {
//       var data = await apiService.post(
//           endpoint: "login", data: {"email": email, "password": password});
//
//       LoginModel response = LoginModel.fromJson(data);
//       CacheServices.saveData(key: "token", value: response.data!.token);
//       CacheServices.saveData(key: "userName", value: response.data!.name);
//       CacheServices.saveData(key: "user_id", value: response.data!.userId);
//
//       return (Right(response));
//     } catch (e) {
//       // ignore: avoid_print
//       print("error in login Repository");
//       if (e is DioException) {
//         if (e.response!.statusCode == 401) {
//           return Left(ServerFailure("Your email or password is not correct"));
//         }
//         if (e.response!.statusCode == 403) {
//           return Left(ServerFailure(
//               "Your account is not verified. Sign Up with your Information ,Check your email for verification code."));
//         }
//         if (e.response!.statusCode == 422) {
//           return Left(
//               ServerFailure("You should complete your account information"));
//         }
//         return Left(ServerFailure.fromDioError(e));
//       } else {
//         return Left(ServerFailure(e.toString()));
//       }
//     }
//   }
//
//   @override
//   Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
//       {required String email}) async {
//     try {
//       var data = await apiService
//           .post(endpoint: "forgetPassword", data: {"email": email});
//
//       ForgetPasswordModel response = ForgetPasswordModel.fromJson(data);
//
//       return Right(response);
//     } catch (e) {
//       if (e is DioException) {
//         if (e.response!.statusCode == 422) {
//           return Left(ServerFailure("Invalid email"));
//         }
//         if (e.response!.statusCode == 403) {
//           return Left(ServerFailure("Your account is not verified."));
//         }
//         return Left(ServerFailure.fromDioError(e));
//       } else {
//         return Left(ServerFailure(e.toString()));
//       }
//     }
//   }
//
//   @override
//   Future<Either<Failure, ResetPasswordCodeModel>> resetPasswordCode(
//       {required String email, required int otbCode}) async {
//     try {
//       var data = await apiService.post(
//           endpoint: "checkResetPasswordCode",
//           data: {"email": email, "code": otbCode});
//
//       ResetPasswordCodeModel response = ResetPasswordCodeModel.fromJson(data);
//       return Right(response);
//     } catch (e) {
//       // ignore: avoid_print
//       print("Error in Reset Password Code Repository");
//       if (e is DioException) {
//         if (e.response!.statusCode == 422) {
//           return Left(ServerFailure("Wrong Reset Password Code."));
//         }
//         return Left(ServerFailure.fromDioError(e));
//       } else {
//         return Left(ServerFailure(e.toString()));
//       }
//     }
//   }
//
//   @override
//   Future<Either<Failure, ResetPasswordModel>> resetPassword(
//       {required String email,
//       required String password,
//       required String passwordConfirmation}) async {
//     try {
//       var data = await apiService.post(endpoint: "resetPassword", data: {
//         "email": email,
//         "password": password,
//         "password_confirmation": passwordConfirmation
//       });
//       ResetPasswordModel response = ResetPasswordModel.fromJson(data);
//       CacheServices.saveData(key: "token", value: response.token);
//       return Right(response);
//     } catch (e) {
//       // ignore: avoid_print
//       print("Error in Reset password Repository");
//       if (e is DioException) {
//         if (e.response!.statusCode == 422) {
//           return Left(ServerFailure(
//               "Password changed successfully, but You should complete your account information."));
//         }
//         return Left(ServerFailure.fromDioError(e));
//       } else {
//         return Left(ServerFailure(e.toString()));
//       }
//     }
//   }
// }