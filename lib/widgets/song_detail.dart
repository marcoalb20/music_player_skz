import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:music_player_skz/providers/page_provider.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:provider/provider.dart';

class SongDetail extends StatelessWidget {
  const SongDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        AlbumDetail(),
        SizedBox(height: 20),
        ProgressBarSong(),
        SizedBox(height: 20),
        SongButtons(),
      ],
    );
  }
}

class AlbumDetail extends StatelessWidget {
  const AlbumDetail({super.key});

  static PageProvider pageProvider = PageProvider();

  TextStyle customTextStyle({bool bold = false}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      color: Colors.white,
      height: 1,
      fontFamily: 'NotoSansJP',
    );
  }

  static String albumPath = 'assets/images/album.png';

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);
    return Container(
      height: pageProvider.phoneHeight(context) * 0.6,
      width: pageProvider.phoneWidth(context) * 0.8,
      decoration: BoxDecoration(
        color: pageProvider.blackColorApp,
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
            height: pageProvider.phoneWidth(context) * 0.6,
            width: pageProvider.phoneWidth(context) * 0.6,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: pageProvider.blackColorApp,
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
                  child: Image.asset(albumPath, fit: BoxFit.cover),
                ),
                Container(
                  height: pageProvider.phoneWidth(context) * 0.6,
                  width: pageProvider.phoneWidth(context) * 0.6,
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
          Column(
            children: [
              Text(
                songsProvider.currentSong.title,
                style: customTextStyle(bold: true),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('- SKZ -', style: customTextStyle()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProgressBarSong extends StatelessWidget {
  const ProgressBarSong({super.key});
  static PageProvider pageProvider = PageProvider();

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTapDown: (details) {
              double tapPositionX = details.localPosition.dx;
              double newProgress = (tapPositionX / constraints.maxWidth).clamp(
                0.0,
                1.0,
              );

              songsProvider.seekToProgress(newProgress);
            },
            child: Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: pageProvider.blackColorApp.withAlpha(200),
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
            ),
          );
        },
      ),
    );
  }
}

class SongButtons extends StatelessWidget {
  const SongButtons({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    return Row(
      children: [
        Spacer(),
        CustomButtons(
          buttonAction: songsProvider.previousSongButton,
          icon: HugeIcons.strokeRoundedPrevious,
        ),
        SizedBox(width: 30),
        CustomButtons(
          buttonAction: songsProvider.continueButtonAction,
          icon: songsProvider.continueButtonIcon(),
          padding: 15,
          size: 35,
        ),
        SizedBox(width: 30),
        CustomButtons(
          buttonAction: songsProvider.nextSongButton,
          icon: HugeIcons.strokeRoundedNext,
        ),
        Spacer(),
      ],
    );
  }
}

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.buttonAction,
    required this.icon,
    this.padding = 10,
    this.size = 30,
  });

  final VoidCallback buttonAction;
  final List<List<dynamic>> icon;
  final double padding;
  final double size;

  static PageProvider pageProvider = PageProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: pageProvider.blackColorApp,
        borderRadius: BorderRadius.circular(150),
      ),
      child: InkWell(
        onTap: buttonAction,
        child: HugeIcon(icon: icon, color: Colors.white, size: size),
      ),
    );
  }
}
