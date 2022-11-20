// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ct48402/ui/shared/dialog_utils.dart';
import 'package:provider/provider.dart';

import '../../models/play_list.dart';
import 'play_list_manager.dart';

class PlayListCard extends StatelessWidget {
  final String filmId;
  final PlayList playList;
  // ignore: empty_constructor_bodies
  const PlayListCard({
    required this.filmId,
    required this.playList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(playList.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      // ignore: sort_child_properties_last
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Do you want to remove the film from the playList',
        );
      },
      onDismissed: (direction) {
        context.read<PlayListManager>().removeItem(filmId);
        // ignore: avoid_print
        // print('Film dismissed');
      },
      child: buildPlayList(),
    );
  }

  Widget buildPlayList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 183, 10),
              image: const DecorationImage(
                image: NetworkImage(''),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 5, color: Colors.orange),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 370,
                  child: ListView(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          playList.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    playList.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPlayList1() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          // leading: const CircleAvatar(
          //   child: Padding(
          //     padding: EdgeInsets.all(5),
          //     // child: FittedBox(
          //     //   child: Text('bcnbdscnbsmdbm'),
          //     // ),
          //   ),
          // ),
          title: Text(playList.name),
          // subtitle: const Text('dbcbnbdncndc'),
          // trailing: const Text('cbdjbchbdcbdhcd'),
        ),
      ),
    );
  }
}
