import 'package:clean_arc_str/core/error/failures.dart';
import 'package:clean_arc_str/core/network/network_info.dart';
import 'package:clean_arc_str/data/data_source/comment_data_source.dart';
import 'package:clean_arc_str/domain/entity/entity.dart';
import 'package:clean_arc_str/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class CommentRepositoryImpl implements CommentRepository {
  final NetworkInfo networkInfo;
  final CommentRemoteDataSource commentRemoteDataSource;
  CommentRepositoryImpl({
    required this.networkInfo,
    required this.commentRemoteDataSource,
  });

  @override
  Future<Either<Failure, CommentEntity>> getPosts() async {
    // checking if there is internet connection
    if (await networkInfo.isConnected) {
      try {
        print('here');
        //getting the parsed data and saving in 'postEntity' variable to use in the presentation layer
        CommentEntity postEntity = await commentRemoteDataSource.getPosts();
        return Right(postEntity);
      } catch (e) {
        print('error here');
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
