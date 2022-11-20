import 'dart:convert';

import 'package:ct48402/services/firebase_service.dart';
import 'package:http/http.dart' as http;

import '../models/auth_token.dart';
import '../models/comment.dart';

class CommnentsService extends FirebaseService {
  CommnentsService([AuthToken? authToken]) : super(authToken);
  
  Future<List<Comment>> fetchCommnents() async {
    final List<Comment> comments = [];

    try {
      // final filters = 'orderBy="creatorId"&equalTo="$userId"';
      final commentsUrl =
          Uri.parse('$databaseUrl/comments/$userId.json?auth=$token');
      final response = await http.get(commentsUrl);
      final commentsMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        // ignore: avoid_print
        print(commentsMap['error']);
        return comments;
      }
      commentsMap.forEach((commentId, comment) {
        comments.add(
          Comment.fromJson({
            'id': commentId,
            ...comment,
          })
        );
      });

      return comments;
    }catch(err) {
      // ignore: avoid_print
      print(err);
      return comments;
    }
  }
}