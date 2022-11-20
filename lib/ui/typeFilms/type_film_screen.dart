import 'package:ct48402/ui/shared/app_drawer.dart';
import 'package:ct48402/ui/typeFilms/type_film_card.dart';
import 'package:ct48402/ui/typeFilms/type_film_manager.dart';
import 'package:flutter/material.dart';

class TypeFilmScreen extends StatelessWidget {
  static const routeName = '/type-films';
  const TypeFilmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typesManager = TypeFilmManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Type of Film',
          style: TextStyle(
            letterSpacing: 2,
            wordSpacing: 3
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 30,),
            tooltip: 'Search for type of film',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      drawer:const AppDrawer(),
      body: ListView.builder(
        itemCount: typesManager.typeFilmCount,
        itemBuilder: (ctx, i) => TypeFilmCard(typesManager.typeFilms[i]),
      ),
    );
  }
}
