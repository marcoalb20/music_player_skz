import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_skz/models/song_model.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  HeaderPlaylist(),
                  ButtonsMediaPlaylist(),
                  ListSongsDetailsPlaylist(),
                  SizedBox(height: 100),
                ],
              ),
            ),
            BottomMediaActionPlaylist(),
          ],
        ),
      ),
    );
  }
}

class HeaderPlaylist extends StatelessWidget {
  const HeaderPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.15),
                    blurRadius: 20,
                    spreadRadius: 15,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/album.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Album | 17 canciones | 2026',
                style: TextStyle(
                  color: Colors.grey,
                  height: 1,
                  fontFamily: 'NotoSansJP',
                ),
              ),
              Text(
                'GO LIVE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'NotoSansJP',
                ),
              ),
              Text(
                'Stray Kids',
                style: TextStyle(color: Colors.grey, fontFamily: 'NotoSansJP'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonsMediaPlaylist extends StatelessWidget {
  const ButtonsMediaPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.15),
                    blurRadius: 30,
                    spreadRadius: 15,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HugeIcon(icon: HugeIcons.strokeRoundedPlayCircle),
                  SizedBox(width: 10),
                  Text(
                    'Reproducir',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedShuffleSquare,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Aleatorio',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListSongsDetailsPlaylist extends StatelessWidget {
  const ListSongsDetailsPlaylist({super.key});

  static List<SongModel> songsItems = [
    SongModel(
      title: 'GO LIVE (GO生)',
      durationString: '1:51',
      url: 'sounds/cancion_1.mp3',
    ),
    SongModel(
      title: "God's Menu (神メニュ)",
      durationString: '3:07',
      url: 'sounds/cancion_2.mp3',
    ),
    SongModel(
      title: 'Easy',
      durationString: '3:04',
      url: 'sounds/cancion_3.mp3',
    ),
    SongModel(
      title: 'Pacemaker',
      durationString: '3:11',
      url: 'sounds/cancion_4.mp3',
    ),
    SongModel(
      title: 'Airplane',
      durationString: '3:35',
      url: 'sounds/cancion_5.mp3',
    ),
    SongModel(
      title: 'Another Day (일상)',
      durationString: '2:47',
      url: 'sounds/cancion_6.mp3',
    ),
    SongModel(
      title: 'Phobia',
      durationString: '3:33',
      url: 'sounds/cancion_7.mp3',
    ),
    SongModel(
      title: 'Blueprint (청사진)',
      durationString: '4:12',
      url: 'sounds/cancion_8.mp3',
    ),
    SongModel(title: 'TA', durationString: '3:29', url: 'sounds/cancion_9.mp3'),
    SongModel(
      title: 'Haven',
      durationString: '3:19',
      url: 'sounds/cancion_10.mp3',
    ),
    SongModel(
      title: 'TOP ("Tower of God" OP)',
      durationString: '3:17',
      url: 'sounds/cancion_11.mp3',
    ),
    SongModel(
      title: 'SLUMP ("Tower of God" ED)',
      durationString: '2:15',
      url: 'sounds/cancion_12.mp3',
    ),
    SongModel(
      title: 'Mixtape : Gone Days',
      durationString: '3:23',
      url: 'sounds/cancion_13.mp3',
    ),
    SongModel(
      title: 'Mixtape : On Track (바보라도 알아)',
      durationString: '3:34',
      url: 'sounds/cancion_14.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: songsItems.length,
      itemBuilder: (context, index) {
        return SongItem(num: index + 1, songModel: songsItems[index]);
      },
    );
  }
}

class SongItem extends StatelessWidget {
  const SongItem({super.key, required this.num, required this.songModel});

  final int num;
  // final String songTitle;
  // final String songDuration;
  final SongModel songModel;

  String songNumber() {
    if (num < 10) {
      return '0$num';
    } else {
      return '$num';
    }
  }

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    AudioPlayer player = songsProvider.audioPlayer;
    void playAudio(String assetPath) async {
      player.stop();
      player.setAsset(assetPath);
      player.play();
      songsProvider.isPlaying = true;
    }

    return InkWell(
      onTap: () {
        songsProvider.currentSong = songModel;
        playAudio(songModel.url);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Text(
              songNumber(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songModel.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
                Text(
                  'SKZ - ${songModel.durationString}',
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
                print('Favorito - ${songModel.title}');
              },
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedFavourite,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomMediaActionPlaylist extends StatelessWidget {
  const BottomMediaActionPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    AudioPlayer player = songsProvider.audioPlayer;

    void ContinueAudio() {
      player.play();
    }

    void stopAudio() {
      player.pause();
    }

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
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
              blurRadius: 30,
              spreadRadius: 15,
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
                // if (songsProvider.isPlaying) {
                //   songsProvider.isPlaying = false;
                //   stopAudio();
                //   print('Pausando...');
                // } else {
                //   if (songsProvider.currentSong.url.isNotEmpty) {
                //     songsProvider.isPlaying = true;
                //     print('Reproduciendo...');
                //     playAudio(songsProvider.currentSong.url);
                //   } else {
                //     print('No se ha seleccionado una canción');
                //   }
                // }
                // songsProvider.isPlaying = !songsProvider.isPlaying;

                if (songsProvider.currentSong.url.isNotEmpty) {
                  if (songsProvider.isPlaying) {
                    songsProvider.isPlaying = false;
                    stopAudio();
                    print('Pausando...');
                  } else {
                    songsProvider.isPlaying = true;
                    print('Reproduciendo...');
                    ContinueAudio();
                  }

                  // print('Reproduciendo...');
                  // playAudio(songsProvider.currentSong.url);
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
    );
  }
}
