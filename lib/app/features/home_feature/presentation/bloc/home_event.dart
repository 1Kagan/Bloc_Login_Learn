part of 'home_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

final class PostFetched extends HomeBlocEvent {}
