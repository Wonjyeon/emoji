import 'package:flutter/cupertino.dart';

class Post {
  IconData icon;
  String title;
  String body;
  DateTime createdAt;

  Post({this.body, this.createdAt, this.icon, this.title});
}
