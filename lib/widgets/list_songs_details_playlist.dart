import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_skz/models/song_model.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

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
