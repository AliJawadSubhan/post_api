import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:post_data/model/post_model.dart';

class SendData {
  Future<void> postApi(Posts posts) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    try {
      var result = await http.post(
        Uri.parse(url),
        body: json.encode(posts.toJson()),
      );
      if (result.statusCode != 201) {
        throw Exception(
            'Failed to post data to API, status code: ${result.statusCode}');
      }
    } catch (e) {
      if (e is SocketException) {
        // Handle network connectivity errors
        throw Exception('Failed to connect to API server');
      } else {
        // Handle other errors
        throw Exception('Failed to post data to API: $e');
      }
    }
  }
}
