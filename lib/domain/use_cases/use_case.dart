import 'package:clean_arc_str/core/error/failures.dart';
import 'package:clean_arc_str/core/use_cases/use_cases.dart';
import 'package:clean_arc_str/domain/entity/entity.dart';
import 'package:clean_arc_str/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class GetCommentUseCase
    implements UseCases<Either<Failure, CommentEntity>, NoParams> {}

class GetCommentUseCaseImpl implements GetCommentUseCase {
  CommentRepository commentRepository;
  GetCommentUseCaseImpl({required this.commentRepository});

  @override
  Future<Either<Failure, CommentEntity>> call(NoParams params) {
    return commentRepository.getPosts();
  }
}
