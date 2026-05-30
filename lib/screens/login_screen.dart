import 'package:flutter/material.dart';
import 'package:music_player_skz/widgets/widgets.dart';
// import '';
// import 'package:just_audio/just_audio.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // static final player = AudioPlayer(); // Create a player
  // void playAudio() async {
  //   final duration = await player.setAsset('assets/sounds/cancion_1.mp3');
  // }

  @override
  Widget build(BuildContext context) {
    // playAudio();

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


 // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Container(
          //     width: phoneWidth,
          //     padding: EdgeInsets.all(10),
          //     child: InkWell(
          //       onTap: () {
          //         player.play();
          //         print(player.positionStream);
          //         print('Reproduciendo...');
          //       },
          //       child: Container(
          //         color: Colors.white,
          //         height: 50,
          //         width: 200,
          //         child: Center(child: Text('Reproducir')),
          //       ),
          //     ),
          //   ),
          // Column(
          //   children: [
          //     Container(
          //       width: phoneWidth,
          //       padding: EdgeInsets.all(10),
          //       child: InkWell(
          //         onTap: () {
          //           player.play();
          //           print(player.positionStream);
          //           print('Reproduciendo...');
          //         },
          //         child: Container(
          //           color: Colors.white,
          //           height: 50,
          //           width: 200,
          //           child: Center(child: Text('Reproducir')),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: phoneWidth,
          //       padding: EdgeInsets.all(10),
          //       child: InkWell(
          //         onTap: () {
          //           player.stop();
          //           print(player.positionStream);
          //           print('stop');
          //         },
          //         child: Container(
          //           color: Colors.white,
          //           height: 50,
          //           width: 200,
          //           child: Center(child: Text('stop')),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       width: phoneWidth,
          //       padding: EdgeInsets.all(10),
          //       child: InkWell(
          //         onTap: () async {
          //           final position =
          //               await player.positionStream.first; // 👈 await aquí
          //           print('Posición: ${position}');
          //           print('Duración: ${player.duration}');
          //         },
          //         child: Container(
          //           color: Colors.white,
          //           height: 50,
          //           width: 200,
          //           child: Center(child: Text('duracion')),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // ),