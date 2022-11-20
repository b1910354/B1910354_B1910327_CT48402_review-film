import 'package:ct48402/ui/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              // ignore: unnecessary_const
              image: const DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/236x/6c/64/a3/6c64a324f2952be71c638b9935aa50d9.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              'Luffy',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            accountEmail: Text(
              'luffy@onepiece.com',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/b5/20/f9/b520f9cad45f8e334d5840313309232d.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.movie,
              color: Colors.blue,
              size: 30,
            ),
            title: const Text('Film',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.play_arrow,
              color: Colors.blue,
              size: 30,
            ),
            title: const Text('Play List',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(PlayListScreen.routeName);
              Navigator.of(context).pushNamed(PlayListScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.type_specimen,
              color: Colors.blue,
              size: 30,
            ),
            title: const Text('Type of Film',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(PlayListScreen.routeName);
              Navigator.of(context).pushNamed(TypeFilmScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.manage_accounts_outlined,
              color: Colors.blue,
              size: 30,
            ),
            title: const Text('Manage Film',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserFilmsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.blue,
              size: 30,
            ),
            title: const Text('Logout',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300)),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
