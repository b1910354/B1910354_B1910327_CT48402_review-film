import 'package:ct48402/ui/films/films_manager.dart';
import 'package:ct48402/ui/films/user_film_list_tile.dart';
import 'package:ct48402/ui/shared/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen.dart';

class UserFilmsScreen extends StatelessWidget {
  static const routeName = '/user-films';
  const UserFilmsScreen({Key? key}) : super(key: key);

  Future<void> _refreshFilms(BuildContext context) async {
    await context.read<FilmsManager>().fetchFilms(false);
  }

  @override
  Widget build(BuildContext context) {
    // final filmsManager = FilmsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Films Manager'),
        actions: [
          buildAddButton(context),
        ],
        backgroundColor: Colors.indigo,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshFilms(context),
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshFilms(context),
            child: buildUserFilmListView(),
          );
        },
      )
    );
  }

  Widget buildUserFilmListView() {
    return Consumer<FilmsManager>(builder: (ctx, filmsManager, child) {
      return ListView.builder(
        itemCount: filmsManager.itemCount,
        itemBuilder: (ctx, i) => Column(
          children: [
            UserFilmListTile(filmsManager.items[i]),
            // tao dai phan cach giua cac dong
            const Divider(
              color: Colors.white,
            ),
          ],
        ),
      );
    });
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditFilmScreen.routeName,
        );
        // ignore: avoid_print
        // print('Goto edit film screen');
      },
      tooltip: 'add a new film',
      highlightColor: Colors.blue,
      hoverColor: Colors.blue,
    );
  }
}
