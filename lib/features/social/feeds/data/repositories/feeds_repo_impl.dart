import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:socshea/features/social/feeds/data/models/new_post_model.dart';
import 'package:socshea/features/social/feeds/data/repositories/feeds_repo.dart';
import 'package:socshea/utils/exceptions/failures.dart';
import 'package:socshea/utils/exceptions/firebase_auth_exception.dart';
import 'package:socshea/utils/exceptions/firebase_exception.dart';
import 'package:socshea/utils/exceptions/format_exception.dart';
import 'package:socshea/utils/exceptions/platform_exception.dart';

class FeedsRepoImpl implements FeedsRepo{
  final FirebaseFirestore firebaseFirestore;
  FeedsRepoImpl({required this.firebaseFirestore});

  @override
  Future<Either<Failure, NewPostModel>> createNewPost(String text, String postImage, {required String uID, required String name, required String image, required String dateTime}) async{
    try{
      final NewPostModel newPostModel = NewPostModel(uID: uID, name: name, image: image, postImage: postImage, dateTime: dateTime, text: text);

      firebaseFirestore.collection('posts').doc('1').set(newPostModel.toJson());

      return Right(newPostModel);
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
}