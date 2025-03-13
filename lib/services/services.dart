import 'dart:convert';
import 'package:app/models/post.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<Post>> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      var body = jsonDecode(response.body);
      List<Post> posts =
          body.map<Post>((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw 'Failed to load post';
    }
  }
}
