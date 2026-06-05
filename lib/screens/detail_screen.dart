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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF121212),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: colorApp,
                gradient: LinearGradient(
                  colors: [
                    colorApp,
                    Color.fromARGB(129, 18, 18, 18),
                    Color(0xFF121212),
                  ],
                  end: Alignment.topRight,
                  begin: Alignment.bottomLeft,
                ),
              ),
            ),
            Column(
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
                        spreadRadius: -5,
                        offset: Offset(0, -10),
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
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.15),
                              blurRadius: 5,
                              spreadRadius: -5,
                              offset: Offset(0, -10),
                            ),
                          ],
                        ),
                        child: Stack(
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
                                    Colors.black.withValues(alpha: 0.8),
                                  ],
                                  stops: [0.5, 0.9, 1.0],
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  child: // Reemplaza el LinearProgressIndicator por esto:
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        height: 6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF121212).withAlpha(200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 6,
                            width: constraints.maxWidth * songsProvider.progress,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
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
                      ),
                      child: InkWell(
                        onTap: () {
                          songsProvider.previousSongButton();
                        },
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedPrevious,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFF121212),
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: InkWell(
                        onTap: () {
                          songsProvider.continueButtonAction();
                        },
                        child: HugeIcon(
                          icon: songsProvider.continueButtonIcon(),
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
                      ),
                      child: InkWell(
                        onTap: () {
                          songsProvider.nextSongButton();
                        },
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedNext,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 15,
              left: 15,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow()],
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
