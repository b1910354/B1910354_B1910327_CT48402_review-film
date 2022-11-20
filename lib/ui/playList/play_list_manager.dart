import 'package:flutter/material.dart';

import '../../models/film.dart';
import '../../models/play_list.dart';
import 'package:flutter/foundation.dart';

class PlayListManager with ChangeNotifier {
  late Map<String, PlayList> _items = {};

  int get filmCount {
    return _items.length;
  }

  List<PlayList> get films {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, PlayList>> get filmsEntries {
    return {..._items}.entries;
  }

  void addItem(Film film) {
    // if (_items.containsKey(film.id)) {
    //    _items.update(
    //   film.id!,
    //    (existingPlayList) => existingPlayList,
    //   );
    // } else {
    _items.putIfAbsent(
      film.id!,
      () => PlayList(
        id: 'pl${DateTime.now().toIso8601String()}',
        name: film.name,
        imageUrl: film.imageUrl,
      ),
    );
    // }
    notifyListeners();
  }

  void removeItem(String filmId) {
    _items.remove(filmId);
    filmCount - 1;
    notifyListeners();
  }

  // void removeSingleItem(String filmId) {
  //   if (!_items.containsKey(filmId)) {
  //     return;
  //   }
  //     if (_items[productId]?.quantify as num > 1) {
  //       _items.update(
  //         productId,
  //         (existingCartItem) => existingCartItem.copyWith(
  //           quantify: existingCartItem.quantify - 1,
  //         ),
  //       );
  //   }
  //   else {
  //     _items.remove(filmId);
  //   }
  //   notifyListeners();
  // }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
