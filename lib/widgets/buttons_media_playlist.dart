import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

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
            child: InkWell(
              onTap: () {
                songsProvider.playButtonAction();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.15),
                      blurRadius: 8,
                      spreadRadius: 5,
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
          ),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                print('Aleatorio');
                songsProvider.changeRandomState();
                // songsProvider.shuffleSongs();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // color: Colors.white.withValues(alpha: 0.2),
                  color: songsProvider.randomButtonColor(),
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
          ),
        ],
      ),
    );
  }
}
