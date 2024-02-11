import 'package:http/http.dart' as http;

class PostDataProvider {
  Future<String> getPosts() async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts',
        ),
      );
      print(res.body.toString());
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
