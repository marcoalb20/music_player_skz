import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
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
      },
    );
  }
}
