import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:music_player_skz/models/song_model.dart';
import 'package:music_player_skz/providers/page_provider.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class ListSongsPlaylist extends StatelessWidget {
  const ListSongsPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);
    List<SongModel> songsItems = songsProvider.songsItems;

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
    PageProvider pageProvider = PageProvider();

    return InkWell(
      onTap: () {
        songsProvider.playNewListSong(songModel);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        color: pageProvider.currentSongColor(
          songsProvider.currentSong,
          songModel,
        ),
        // color: songsProvider.currentSongColor(songModel),
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
                songsProvider.addFavorite(songModel);
              },
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedFavourite,
                color: songModel.isFavorite ? Color(0xFFef4138) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
