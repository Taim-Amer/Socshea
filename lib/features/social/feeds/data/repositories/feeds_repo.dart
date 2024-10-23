import 'package:dartz/dartz.dart';
import 'package:socshea/features/social/feeds/data/models/new_post_model.dart';
import 'package:socshea/utils/exceptions/failures.dart';

abstract class FeedsRepo{
  Future<Either<Failure, NewPostModel>> createNewPost( String postImage,String text, {required String dateTime});
}