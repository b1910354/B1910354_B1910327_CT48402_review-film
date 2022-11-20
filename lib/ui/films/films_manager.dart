import 'package:flutter/cupertino.dart';

import '../../models/auth_token.dart';
import '../../models/film.dart';
import '../../services/films_service.dart';

class FilmsManager with ChangeNotifier {
  List<Film> _items = [];

  final FilmsService _filmsService;
  FilmsManager([AuthToken? authToken])
      : _filmsService = FilmsService(authToken);

  set authToken(AuthToken? authToken) {
    _filmsService.authToken = authToken;
  }

  Future<void> fetchFilms([bool filterByUser = false]) async {
    _items = await _filmsService.fetchFilms(filterByUser);
    notifyListeners();
  }

  Future<void> addFilm(Film film) async {
    print('object');
    final newFilm = await _filmsService.addFilm(film);
    if (newFilm != null) {
      _items.add(newFilm);
      notifyListeners();
    }
  }

  Future<void> updateFilm(Film film) async {
    final index = _items.indexWhere((item) => item.id == film.id);
    if(index>=0) {
      if(await _filmsService.updateFilm(film)) {
        _items[index] = film;
        notifyListeners();
      }
    }
  }

  Future<void> deleteFilm(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Film? existingFilm = _items[index];
    _items.removeAt(index);
    notifyListeners();

    if(!await _filmsService.deleteFilm(id)) {
      _items.insert(index, existingFilm);
      notifyListeners();
    }
  }

  Future<void> updateFavorite(Film film) async {
    final isFavorite = film.isFavorite + 1;
    film.isFavorite = isFavorite;

    await _filmsService.saveFavoriteStatus(film);
  }

  // lay tong so film
  int get itemCount {
    return _items.length;
  }

  // lay tat ca gia tri cua list
  List<Film> get items {
    return [..._items];
  }

  //
  // List<Film> get favoriteItems {
  //   // tra ve mot Iterator moi chua tat cac phan tu
  //   // tao ra mot ds chua cac phan tu do
  //   return _items.where((element) => element.isFavorite).toList();
  // }

  // Tim film theo Id
  Film findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void addFilm(Film film) {
  //   _items.add(
  //     film.copyWith(
  //       id: 'f${DateTime.now().toIso8601String()}',
  //     ),
  //   );
  //   notifyListeners();
  // }

  // void updateFilm(Film film) {
  //   final index = _items.indexWhere((item) => item.id == film.id);
  //   if (index >= 0) {
  //     _items[index] = film;
  //     notifyListeners();
  //   }
  // }
  // Future<void> updateFilm(Film film) async {
  //   final index = _items.indexWhere((item) => item.id == film.id);
  //   if (index >= 0) {
  //     if (await _filmsService.updateFilm(film)) {
  //       _items[index] = film;
  //       notifyListeners();
  //     }
  //   }
  // }

  // void deleteFilm(String id) {
  //   final index = _items.indexWhere((item) => item.id == id);
  //   _items.removeAt(index);
  //   notifyListeners();
  // }
}
