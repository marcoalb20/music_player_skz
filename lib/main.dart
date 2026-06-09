import 'package:flutter/material.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => SongsProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color.fromRGBO(154, 15, 75, 1)),
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginScreen(),
        'playlist': (context) => const PlaylistScreen(),
        'detail': (context) => const DetailScreen(),
      },
    );
  }
}
