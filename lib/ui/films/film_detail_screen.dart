// import 'dart:html';

import 'package:ct48402/models/comment.dart';
import 'package:ct48402/ui/films/comments_manager.dart';
import 'package:ct48402/ui/films/custom_textfield.dart';
import 'package:ct48402/ui/films/films_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comment_box/comment/comment.dart';
import '../../models/film.dart';

class FilmDetailScreen extends StatefulWidget {
  static const routeName = '/film-detail';
  final Film film;
  const FilmDetailScreen(
    this.film, {
    super.key,
  });

  @override
  State<FilmDetailScreen> createState() => _FilmDetailScreenState();
}

class _FilmDetailScreenState extends State<FilmDetailScreen> {
  // final _commentForm = GlobalKey<FormState>();
  // final TextEditingController _commentController = TextEditingController();

  // @override
  // void dispose() {
  //   super.dispose();
  //   _commentController.dispose();
  // }

  // void updateCmt() {

  // }

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final comments = context.select<CommentManager, List<Comment>> (
    //   (commentManager) => commentManager.items
    // );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.film.name,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
        // backgroundColor: Colors.blue,
      ),
      // SingleChildScrollView la mot cai box chi co mot con va co the cuon
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox la mot chiec hop co dinh
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                widget.film.title,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Writer by ${widget.film.writer}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      wordSpacing: 4,
                    ),
                  ),
                  Text(
                    'Published: ${widget.film.pubDate}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      wordSpacing: 4,
                    ),
                  ),
                  Text(
                    'Latest updates: ${widget.film.lastDate}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      wordSpacing: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                widget.film.description,
                textAlign: TextAlign.justify,
                // ngat dong khi toi han
                softWrap: true,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                widget.film.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ! 3
            // ! content
            Container(
              // can ching ngang doc
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                widget.film.content,
                textAlign: TextAlign.justify,
                // ngat dong khi toi han
                softWrap: true,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'The End',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                  letterSpacing: 2,
                  wordSpacing: 4,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context
                              .read<FilmsManager>()
                              .updateFavorite(widget.film);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (ctx) => FilmDetailScreen(widget.film),
                          // )
                          //     // FilmDetailScreen.routeName,
                          //     // arguments: film.id,
                          //     );
                          setState(() {});
                        },
                        hoverColor: Colors.blue,
                        focusColor: Colors.blue,
                        mouseCursor: MouseCursor.defer,
                        highlightColor: Colors.blue,
                        splashColor: Colors.blue,
                      ),
                      Text(
                        // ignore: prefer_adjacent_string_concatenation
                        "  ${widget.film.isFavorite} " + "like",
                        style: const TextStyle(
                            color: Colors.blue,
                            letterSpacing: 2,
                            fontStyle: FontStyle.italic,
                            wordSpacing: 4,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontStyle: FontStyle.italic,
                            wordSpacing: 4,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        hoverColor: Colors.blue,
                        focusColor: Colors.blue,
                        mouseCursor: MouseCursor.defer,
                        highlightColor: Colors.blue,
                        splashColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 6),
              child: Row(
                children: const [
                  Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                  Text(
                    '    Commnent',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      wordSpacing: 4,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const Center(
              child: Text(
                'No comment',
                style: TextStyle(
                  fontSize: 18, color: Colors.white,
                  letterSpacing: 2,
                  wordSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
              child: Divider(
                color: Colors.white,
              ),
            ),
            // commnent
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    // child: CommentBox(
                    //   sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
                    // )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
