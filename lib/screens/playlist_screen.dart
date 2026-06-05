import 'package:flutter/material.dart';
import 'package:music_player_skz/providers/songs_provider.dart';
import 'package:music_player_skz/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SongsProvider songsProvider = Provider.of<SongsProvider>(context);

    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Color(0xFF121212),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  HeaderPlaylist(),
                  ButtonsMediaPlaylist(),
                  ListSongsDetailsPlaylist(),
                  songsProvider.currentSong.url.isNotEmpty
                      ? SizedBox(height: 100)
                      : SizedBox(height: 20),
                ],
              ),
            ),
            if (songsProvider.currentSong.url.isNotEmpty)
              BottomMediaActionPlaylist(),
          ],
        ),
      ),
    );
  }
}
