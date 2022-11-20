import 'package:flutter/material.dart';
import 'package:ct48402/ui/playList/play_list_card.dart';
import 'package:ct48402/ui/playList/play_list_manager.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatelessWidget {
  static const routeName = '/play-list';
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playListManager = context.watch<PlayListManager>();
    // final playListManager = PlayListManager();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('PlayList',
            style: TextStyle(letterSpacing: 2, fontStyle: FontStyle.normal)),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search_outlined,
                size: 30,
              ),
              onPressed: () => {})
        ],
      ),
      body: Column(
        children: [
          buildPlayListSummary(playListManager, context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: buildCartDetails(playListManager),
          ),
        ],
      ),
    );
  }

  Widget buildCartDetails(PlayListManager playListManager) {
    return ListView(
      children: playListManager.filmsEntries
          .map(
            (entry) => PlayListCard(
              filmId: entry.key,
              playList: entry.value,
            ),
          )
          .toList(),
    );
  }

  Widget buildPlayListSummary(
      PlayListManager playListManager, BuildContext context) {
    return Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            // color: Theme.of(context).colorScheme.outline,
            color: Color.fromARGB(255, 231, 135, 9),
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Total of PlayList',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.white),
                    backgroundColor: const Color.fromARGB(255, 231, 135, 9)),
                child: Text(
                  playListManager.filmCount.toString(),
                  style: const TextStyle(
                      fontSize: 20, letterSpacing: 2, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ));
  }
}
