import 'package:ct48402/models/type_film.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TypeFilmCard extends StatefulWidget {
  final TypeFilm types;
  const TypeFilmCard(this.types, {Key? key}) : super(key: key);

  @override
  State<TypeFilmCard> createState() => _TypeFilmCardState();
}

class _TypeFilmCardState extends State<TypeFilmCard> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        buildTypeFilmSummary(),
        if (_expanded) buildTypeFilmDetails()
      ]),
    );
  }

  Widget buildTypeFilmDetails() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      height: widget.types.filmCount * 230,
      child: Column(
        children: widget.types.films
            .map(
              (film) => Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Ink.image(
                              image: NetworkImage(
                                film.imageUrl,
                              ),
                              fit: BoxFit.cover,
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                film.name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2,
                                  backgroundColor: Colors.black54
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildTypeFilmSummary() {
    return ListTile(
      title: Text(
        widget.types.name,
        style: const TextStyle(
            fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        widget.types.filmCount.toString(),
        style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
      ),
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(
            () {
              _expanded = !_expanded;
            },
          );
        },
      ),
    );
  }
}
