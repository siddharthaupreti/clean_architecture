import 'package:clean_arc_str/domain/entity/entity.dart';

class CommentModel extends CommentEntity {
  List<CommentListModel> commentListModel;

  CommentModel({required this.commentListModel})
      : super(commentList: commentListModel);

  factory CommentModel.fromJson(List<dynamic> json) => CommentModel(
      commentListModel: (json)
          .map((e) => CommentListModel.fromJson(e as Map<String, dynamic>))
          .toList());
}

class CommentListModel extends CommentListEntity {
  int postId;
  int id;
  String name;
  String body;
  String email;
  CommentListModel(
      {required this.postId,
      required this.id,
      required this.name,
      required this.body,
      required this.email})
      : super(postId: postId, id: id, name: name, email: email, body: body);

  //parsing the data from the server
  factory CommentListModel.fromJson(Map<String, dynamic> json) =>
      CommentListModel(
          postId: json['postId'],
          id: json['id'],
          name: json['name'],
          body: json['body'],
          email: json['email']);

  //parsing data to send to the server
  Map<String, dynamic> toJson() =>
      {'postId': postId, 'id': id, 'name': name, 'email': email, 'body': body};
}
