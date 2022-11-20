import 'package:ct48402/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/film.dart';

class FilmGridTile extends StatelessWidget {
  final Film film;
  const FilmGridTile(this.film, {super.key});

  @override
  Widget build(BuildContext context) {
    // ClipRRect dung de tao hinh chu nhat bo tron
    return ClipRRect(
      // borderRadius: BorderRadius.circular(10),
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        // widget tu tao
        header: buildGridFooterBar(context),
        // GestureDetector dung de phat hien cu chi nguoi dung
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => FilmDetailScreen(film))
              // FilmDetailScreen.routeName,
              // arguments: film.id,
            );
          },
          child: ListView(
            children: [
              Image.network(
                film.imageUrl,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.deepPurpleAccent,
      // leading: IconButton(
      //   icon: Icon(
      //     film.isFavorite ? Icons.favorite : Icons.favorite_border,
      //   ),
      //   color: Theme.of(context).colorScheme.secondary,
      //   onPressed: () {
      //     // ignore: avoid_print
      //     print('Toggle a favorite film');
      //   },
      // ),
      title: Text(
        film.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 2,
          wordSpacing: 4,
          fontStyle: FontStyle.italic,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.playlist_add,
        ),
        onPressed: () {
          final playlist = context.read<PlayListManager>();
          playlist.addItem(film);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Text(
                  'PlayList to cart ',
                ),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    playlist.removeItem(film.id!);
                  },
                ),
              ),
            );
          // ignore: avoid_print
          // print('Add item to playlist');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
