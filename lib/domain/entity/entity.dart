import 'package:flutter/material.dart';

//same as model but entity will be used in presentation layer to display the data

class CommentEntity {
  final List<CommentListEntity>? commentList;
  CommentEntity({this.commentList});
}

class CommentListEntity {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  CommentListEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
}
