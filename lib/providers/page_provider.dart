import 'package:flutter/material.dart';
import 'package:music_player_skz/models/song_model.dart';

class PageProvider {
  final Color _redColorApp = Color(0xFFef4138);
  final Color _blackColorApp = Color(0xFF121212);

  Color get redColorApp => _redColorApp;
  Color get blackColorApp => _blackColorApp;

  double phoneWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double phoneHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  Color currentSongColor(SongModel currentSong, SongModel selectedSong) {
    // currentSong value
    if (currentSong == selectedSong) {
      return Color(0xFFef4138).withAlpha(50);
    } else {
      return Color(0xFF121212);
    }
  }

  Color randomButtonColor(bool value) {
    // random value
    if (value) {
      return Color(0xFFef4138).withAlpha(50);
    } else {
      return Colors.white.withValues(alpha: 0.2);
    }
  }
}
