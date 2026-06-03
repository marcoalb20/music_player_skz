import 'package:flutter/material.dart';
import 'package:music_player_skz/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BlurTopLogin(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AlbumCoverLogin(), ButtonPageLogin()],
          ),
        ],
      ),
    );
  }
}
