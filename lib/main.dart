import 'package:flutter/material.dart';
import 'package:post_data/home/home.dart';

void main(List<String> args) {
  runApp(PostApi());
}

class PostApi extends StatelessWidget {
  const PostApi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
