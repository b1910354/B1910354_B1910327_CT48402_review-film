import 'package:ct48402/models/auth_token.dart';
import 'package:flutter/material.dart';

import '../../models/comment.dart';
import '../../services/comments_service.dart';

class CommentManager with ChangeNotifier {
  List<Comment> _items = [];
  final CommnentsService _commnentsService;

  CommentManager([AuthToken? authToken])
      : _commnentsService = CommnentsService(authToken);

  set authToken(AuthToken? authToken) {
    _commnentsService.authToken = authToken;
  }

  Future<void> fetchFilms() async {
    _items = await _commnentsService.fetchCommnents();
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  // lay tat ca gia tri cua list
  List<Comment> get items {
    return [..._items];
  }
}
