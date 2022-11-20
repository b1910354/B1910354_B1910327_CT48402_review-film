import 'film.dart';

class TypeFilm {
  final String? id;
  final String name;
  final List<Film> films;

  int get filmCount {
    return films.length;
  }

  TypeFilm({
    this.id,
    required this.name,
    required this.films
  });

  TypeFilm copyWith({
    String ?id,
    double? amount,
    List<Film>? films,
  }) {
    return TypeFilm(
      id: id ?? this.id,
      name: name,
      films: films ?? this.films,
    );
  }
}