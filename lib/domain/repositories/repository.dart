import 'package:clean_arc_str/domain/entity/entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class CommentRepository {
  Future<Either<Failure, CommentEntity>> getPosts();
}
