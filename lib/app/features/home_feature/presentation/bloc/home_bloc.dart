import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_responsive_login_ui/app/features/home_feature/data/model/post_model.dart';
import 'package:flutter_responsive_login_ui/app/features/home_feature/data/repository/post_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final PostRepository homeRepository;
  HomeBloc(this.homeRepository) : super(HomeBlocInitial()) {
    on<PostFetched>(_getPosts);
  }

  void _getPosts(
    PostFetched event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final posts = await homeRepository.getPost();
      emit(HomeSuccess(postModel: posts));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
