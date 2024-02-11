import 'dart:convert';

import '../data_provider/post_data_provider.dart';
import '../model/post_model.dart';

class PostRepository {
  final PostDataProvider postDataProvider;
  PostRepository(this.postDataProvider);

  Future<PostModel> getPost() async {
    try {
      final postData = await postDataProvider.getPosts();

      final data = jsonDecode(postData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return PostModel.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
