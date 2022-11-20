
import 'package:ct48402/ui/films/films_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/film.dart';
import 'edit_film_screen.dart';

class UserFilmListTile extends StatelessWidget {
  const UserFilmListTile(this.film, {Key? key}) : super(key: key);
  final Film film;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        film.name,
        style: const TextStyle(
          color: Colors.blue,
          letterSpacing: 1,
          wordSpacing: 2,
          fontSize: 16,
          fontStyle: FontStyle.italic,
          fontFamily: 'Material Icons',
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(film.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          buildEditButton(context),
          buildDeleteButton(context),
        ]),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        context.read<FilmsManager>().deleteFilm(film.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
          const SnackBar(
            content : Text('Film deleted',
            textAlign: TextAlign.center,
            ),
        ),
    );
          
      },
      // onPressed: () async {
      //   // ignore: avoid_print
      //   print('Delete a product');
      // },
      color: Theme.of(context).errorColor,
      iconSize: 20,
      tooltip: 'Delete film',
      highlightColor: Colors.blue,
      hoverColor: Colors.blue,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditFilmScreen.routeName,
          arguments: film.id,
        );
        // ignore: avoid_print
        // print('Edit a product');
      },
      color: Colors.yellow,
      iconSize: 20,
      tooltip: 'Edit film',
      highlightColor: Colors.blue,
      hoverColor: Colors.blue,
    );
  }
}
