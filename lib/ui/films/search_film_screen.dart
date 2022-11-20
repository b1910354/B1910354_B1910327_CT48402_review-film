import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/film.dart';
import 'film_grid_tile.dart';
import 'films_manager.dart';

class CustomSearch extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(
            Icons.clear,
            color: Colors.black87,
          ),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black87,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final films = context
        .select<FilmsManager, List<Film>>((filmsManager) => filmsManager.items);

    List<Film> matchQuery = [];

    for (var item in films) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return matchQuery.isNotEmpty
        ? ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index].name;
              return ListTile(
                title: Text(
                  result,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 2,
                    wordSpacing: 4,
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No data available',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 2,
                  wordSpacing: 4,
                ),
              ),
            ),
          );
  }

  @override
  Widget buildResults(BuildContext context) {
    final films = context
        .select<FilmsManager, List<Film>>((filmsManager) => filmsManager.items);

    List<Film> matchQuery = [];

    for (var item in films) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return matchQuery.isNotEmpty
        ? GridView.builder(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 20,
            ),
            itemCount: matchQuery.length,
            itemBuilder: (context, index) => FilmGridTile(matchQuery[index]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 10 / 6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          )
        : const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'No data available',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 2,
                  wordSpacing: 4,
                ),
              ),
            ),
          );
  }
}
