part of 'bloc.dart';

abstract class PracticeState {}

class InitialPracticeState extends PracticeState {}

class LoadingState extends PracticeState {}

class LoadingErrorState extends PracticeState {
  final String errorMessage;
  LoadingErrorState(this.errorMessage);
}

class PracticeLoadedState extends PracticeState {
  final CommentEntity postEntity;
  PracticeLoadedState(this.postEntity);
}
