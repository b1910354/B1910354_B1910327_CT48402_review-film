import 'dart:convert';

import 'package:ct48402/services/firebase_service.dart';
import 'package:http/http.dart' as http;

import '../models/auth_token.dart';
import '../models/film.dart';

class FilmsService extends FirebaseService {
  FilmsService([AuthToken? authToken]) : super(authToken);

  Future<List<Film>> fetchFilms([bool filterByUser = false]) async {
    final List<Film> films = [];

    try {
      final filters =
          filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      final filmsUrl =
          Uri.parse('$databaseUrl/films.json?auth=$token&$filters');
      final response = await http.get(filmsUrl);
      final filmsMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        // ignore: avoid_print
        print(filmsMap['error']);
        return films;
      }

      final userFavoritesUrl = 
        Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');

      final userFavoritesResponse = await http.get(userFavoritesUrl);
      final userFavoritesMap = json.decode(userFavoritesResponse.body);

      filmsMap.forEach((filmId, film) {
        final isFavorite = (userFavoritesMap == null)
          ? 0
          : (userFavoritesMap[filmId]);
        // final isFavorite = userFavoritesMap[filmId];
        films.add(
          Film.fromJson({
            'id': filmId,
            ...film,
          }).copyWith(isFavorite: isFavorite),
        );
      });
      return films;
    } catch (error) {
      // ignore: avoid_print
      print(error);
      return films;
    }
  }

  Future<Film?> addFilm(Film film) async {
    try {
      final url = Uri.parse('$databaseUrl/films.json?auth=$token');
      final response = await http.post(url,
          body: json.encode(film.toJson()
            ..addAll({
              'createrId': userId,
            })));
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return film.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (err) {
      // ignore: avoid_print
      print(err);
      return null;
    }
  }

  Future<bool> updateFilm(Film film) async {
    try {
      final url = Uri.parse('$databaseUrl/films/${film.id}.json?auth=$token');
      final response = await http.patch(
        url,
        body: json.encode(film.toJson()),
      );

      if(response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }

      return true;
    }catch(error) {
      // ignore: avoid_print
      print(error);
      return false;
    }
  }

  Future<bool> deleteFilm(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/films/$id.json?auth=$token');
      final response = await http.delete(url);
      if(response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    }catch(error) {
      // ignore: avoid_print
      print(error);
      return false;
    }
  }

  Future<bool> saveFavoriteStatus(Film film) async {
    try {
      final url = Uri.parse(
        '$databaseUrl/userFavorites/$userId/${film.id}.json?auth=$token'
      );

      final response = await http.put(
        url,
        body: json.encode(film.isFavorite),
      );

      if(response.statusCode!= 200) {
        throw Exception(json.decode(response.body)['error']);
      }

      return true;

    }catch(err) {
      // ignore: avoid_print
      print(err);
      return false;
    }
  }
}
