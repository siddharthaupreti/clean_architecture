import 'package:clean_arc_str/core/network/network_utils.dart';
import 'package:clean_arc_str/core/resources/app_url.dart';
import 'package:clean_arc_str/data/model/model.dart';
import 'package:clean_arc_str/domain/entity/entity.dart';
import 'package:dio/dio.dart';

abstract class CommentRemoteDataSource {
  Future<CommentEntity> getPosts();
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final NetworkUtil networkUtil;
  CommentRemoteDataSourceImpl({
    required this.networkUtil,
  });

  @override
  Future<CommentEntity> getPosts() async {
    try {
      //sending http get request and waiting for response
      //putting the response value in 'response variable'
      Response response = await networkUtil.get(
        '${AppUrl.COMMENTS_URL}',
      );
      print("anything");
      print(response);
      //parsing the response and putting the value in 'commentModel' variable
      CommentModel commentModel =
          CommentModel.fromJson(networkUtil.parseNormalResponse(response));
      return commentModel;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
