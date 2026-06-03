import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class BottomMediaActionPlaylist extends StatelessWidget {
  const BottomMediaActionPlaylist({super.key});

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

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: InkWell(
        onTap: () {
          print('Abriendo detalles');
          Navigator.pushNamed(context, 'detail');
        },
        child: Container(
          height: 90,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.15),
                blurRadius: 8,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 90,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/album.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    songsProvider.currentSong.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                  Text(
                    'SKZ - ${songsProvider.currentSong.durationString}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
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
                  // icon: HugeIcons.strokeRoundedPauseCircle,
                  icon: (songsProvider.isPlaying)
                      ? HugeIcons.strokeRoundedPauseCircle
                      : HugeIcons.strokeRoundedPlayCircle,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
