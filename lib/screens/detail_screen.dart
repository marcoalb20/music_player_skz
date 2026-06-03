import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    AudioPlayer player = songsProvider.audioPlayer;

    void continueAudio() {
      player.play();
    }

    void stopAudio() {
      player.pause();
    }

    Color colorApp = Color(0xFFef4138);
    Size size = MediaQuery.of(context).size;
    double phoneWidth = size.width;
    double phoneHeight = size.height;

    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF121212),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              height: phoneHeight * 0.6,
              width: phoneWidth * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFF121212),
                borderRadius: BorderRadius.circular(150),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.15),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: phoneWidth * 0.6,
                    width: phoneWidth * 0.6,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF121212),
                      // color: Color.fromARGB(255, 255, 0, 0),
                      borderRadius: BorderRadius.circular(150),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.15),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      // fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.asset(
                            'assets/images/album.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: phoneWidth * 0.6,
                          width: phoneWidth * 0.6,
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black.withValues(
                                  alpha: 0.8,
                                ), // borde negro
                              ],
                              stops: [
                                0.5,
                                0.9,
                                1.0,
                              ], // desde qué punto empieza cada color
                            ),
                            borderRadius: BorderRadius.circular(150),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        songsProvider.currentSong.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1,
                          fontFamily: 'NotoSansJP',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          '- SKZ -',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1,
                            fontFamily: 'NotoSansJP',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.white.withValues(alpha: 0.15),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.15),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedPrevious,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.15),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      if (songsProvider.currentSong.url.isNotEmpty) {
                        if (songsProvider.isPlaying) {
                          songsProvider.isPlaying = false;
                          print('Pausando...');
                          stopAudio();
                        } else {
                          songsProvider.isPlaying = true;
                          print('Reproduciendo...');
                          continueAudio();
                        }
                      } else {
                        print('No se ha seleccionado una canción');
                      }
                    },
                    child: HugeIcon(
                      icon: (songsProvider.isPlaying)
                          ? HugeIcons.strokeRoundedPauseCircle
                          : HugeIcons.strokeRoundedPlayCircle,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.15),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedNext,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
