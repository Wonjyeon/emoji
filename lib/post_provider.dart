import 'package:flutter/cupertino.dart';

import 'models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> posts = [];

  void addPost(Post _post) {
    if (_post.icon != null &&
        _post.title.length != 0 &&
        _post.body.length != 0) {
      print(_post.title);
      posts.insert(0, _post);
    }
    print(posts.length);
    notifyListeners();
  }
}
