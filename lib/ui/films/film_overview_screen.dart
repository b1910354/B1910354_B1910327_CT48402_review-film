import 'package:flutter/material.dart';
import 'package:ct48402/ui/films/films_grid.dart';
import 'package:ct48402/ui/playList/play_list_screen.dart';
import 'package:ct48402/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';

import '../playList/play_list_manager.dart';
import 'films_manager.dart';
import 'search_film_screen.dart';

enum FilterOptions { favorites, all }

class FilmsOverviewScreen extends StatefulWidget {
  const FilmsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<FilmsOverviewScreen> createState() => _FilmsOverviewScreenState();
}

class _FilmsOverviewScreenState extends State<FilmsOverviewScreen> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchFilms;

  @override
  void initState() {
    super.initState();
    _fetchFilms = context.read<FilmsManager>().fetchFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.play_arrow,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Text(
              'KOA',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20.0,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
        actions: [
          buildFilmSearch(),
          buildFilmNotification(),
          // buildFilmFilterMenu(),
          buildFilmPlayList(),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _fetchFilms,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder(
              valueListenable: _showOnlyFavorites,
              builder: (context, onlyFavorite, child) {
                return const FilmsGrid();
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildFilmSearch() {
    return IconButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: CustomSearch(),
        );
      },
      icon: const Icon(Icons.search),
    );
  }

  Widget buildFilmNotification() {
    return IconButton(
      onPressed: () {
        // ignore: avoid_print
        print('Goto play list');
      },
      icon: const Icon(Icons.notifications),
      padding: const EdgeInsets.only(
        right: 15,
      ),
    );
  }

  Widget buildFilmPlayList() {
    return Consumer<PlayListManager>(builder: (ctx, playlistManager, child) {
      return IconButton(
        onPressed: () {
          // ignore: avoid_print
          Navigator.of(context).pushNamed(PlayListScreen.routeName);
        },
        icon: const Icon(Icons.music_video),
        padding: const EdgeInsets.only(
          right: 15,
        ),
      );
    });
  }
}
