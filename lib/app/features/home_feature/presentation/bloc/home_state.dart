part of 'home_bloc.dart';

@immutable
sealed class HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

final class HomeSuccess extends HomeBlocState {
  final PostModel postModel;

  HomeSuccess({required this.postModel});
}

final class HomeFailure extends HomeBlocState {
  final String error;

  HomeFailure(this.error);
}

final class HomeLoading extends HomeBlocState {}
