import 'package:ct48402/ui/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, FilmsManager>(
            create: (ctx) => FilmsManager(),
            update: (ctx, authManager, filmsManager) {
              filmsManager!.authToken = authManager.authToken;
              return filmsManager;
            }),
        ChangeNotifierProvider(
          create: (ctx) => PlayListManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TypeFilmManager(),
        ),
      ],
      child: Consumer<AuthManager>(
        builder: (ctx, authManager, child) {
          return MaterialApp(
            title: 'Review Film',
            // xoa nhan debug tren man hinh ung dung
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.black,
              ),
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
              ).copyWith(
                secondary: Colors.deepOrange,
              ),
            ),
            home: authManager.isAuth
                ? const FilmsOverviewScreen()
                : const AuthScreen(),
            routes: {
              PlayListScreen.routeName: (ctx) => const PlayListScreen(),
              TypeFilmScreen.routeName: (ctx) => const TypeFilmScreen(),
              UserFilmsScreen.routeName: (ctx) => const UserFilmsScreen(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == FilmDetailScreen.routeName) {
                final filmId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return FilmDetailScreen(
                      FilmsManager().findById(filmId),
                    );
                  },
                );
              }
              if (settings.name == EditFilmScreen.routeName) {
                final filmId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditFilmScreen(
                      filmId != null
                          ? ctx.read<FilmsManager>().findById(filmId)
                          : null,
                    );
                  },
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
