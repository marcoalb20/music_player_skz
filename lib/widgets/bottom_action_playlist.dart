import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class BottomMediaActionPlaylist extends StatelessWidget {
  const BottomMediaActionPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: InkWell(
        onTap: () {
          songsProvider.detailButtonAction(context);
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
                  songsProvider.continueButtonAction();
                },
                child: HugeIcon(
                  icon: songsProvider.continueButtonIcon(),
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
