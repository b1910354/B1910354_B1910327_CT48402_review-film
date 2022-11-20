import 'package:ct48402/ui/films/film_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/film.dart';
import 'films_manager.dart';

class FilmsGrid extends StatelessWidget {
  const FilmsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // final filmsManager = FilmsManager();
    // final films = filmsManager.items;
      final films = context.select<FilmsManager, List<Film>>(
        (filmsManager) => filmsManager.items
      );

    return GridView.builder(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20,
      ),
      itemCount: films.length,
      itemBuilder: (ctx, i) => FilmGridTile(films[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio:  10/6,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
