import 'package:clean_arc_str/domain/entity/entity.dart';
import 'package:clean_arc_str/presentation/services/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/injection/injection.dart';
import '../utils/DialogUtils.dart';

class PracticScreen extends StatefulWidget {
  const PracticScreen({Key? key}) : super(key: key);

  @override
  _PracticScreenState createState() => _PracticScreenState();
}

class _PracticScreenState extends State<PracticScreen> {
  PracticeBloc practiceBloc = PracticeBloc(di());
  CommentEntity commentEntity = CommentEntity();

  @override
  void initState() {
    practiceBloc.add(GetPostsEvent());
    super.initState();
  }

  @override
  void dispose() {
    practiceBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: practiceBloc,
        builder: (context, state) {
          return commentEntity.commentList == null
              ? Container(
                  child: Text('loadingggg'),
                )
              : Container(
                  height: 600,
                  child: ListView.separated(
                      itemCount: 20,
                      separatorBuilder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            height: 2,
                            color: Colors.red,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                  'post Id: ${commentEntity.commentList![index].postId}'),
                              Text(
                                  'body: ${commentEntity.commentList![index].body}'),
                              Text(
                                  'id: ${commentEntity.commentList![index].id}'),
                              Text(
                                  'email: ${commentEntity.commentList![index].email}'),
                              Text(
                                  'name: ${commentEntity.commentList![index].name}'),
                            ],
                          ),
                        );
                      }),
                );
        },
        listener: (context, state) {
          if (state is LoadingState) {
            print('loading.....');
            DialogUtils.showLoaderDialog(context);
          }
          if (state is LoadingErrorState) {
            Navigator.pop(context);
            print('loading error state...');
            print(state.errorMessage);
          }
          if (state is PracticeLoadedState) {
            print('practice loadedddddd...');
            Navigator.pop(context);
            setState(() {
              commentEntity = state.postEntity;
            });
            // print(commentEntity.commentList.length);
          }
        },
      ),
    );
  }
}
