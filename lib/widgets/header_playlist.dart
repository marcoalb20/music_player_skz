import 'package:flutter/material.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class HeaderPlaylist extends StatelessWidget {
  const HeaderPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);
    int totalsSongs = songsProvider.songsItems.length;

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
                    blurRadius: 8,
                    spreadRadius: 5,
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
                'Album | $totalsSongs canciones | 2020',
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
