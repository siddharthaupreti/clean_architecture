import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_cases.dart';
import '../../domain/entity/entity.dart';
import '../../domain/use_cases/use_case.dart';

part 'state.dart';
part 'event.dart';

class PracticeBloc extends Bloc<PracticeEvent, PracticeState> {
  PracticeBloc(this.getPostUseCase) : super(InitialPracticeState());
  GetCommentUseCase getPostUseCase;

  @override
  Stream<PracticeState> mapEventToState(PracticeEvent event) async* {
    if (event is GetPostsEvent) {
      yield LoadingState();
      yield* _getPosts(await getPostUseCase.call(NoParams()));
    }
  }

  Stream<PracticeState> _getPosts(
      Either<Failure, CommentEntity> either) async* {
    yield either.fold((l) => LoadingErrorState(l.failureMessage),
        (r) => PracticeLoadedState(r));
  }
}
