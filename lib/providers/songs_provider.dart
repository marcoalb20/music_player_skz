import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_skz/models/song_model.dart';

class SongsProvider extends ChangeNotifier {
  SongModel _currentSong = SongModel(
    title: 'Selecciona una canción',
    durationString: '0:00',
    url: '',
  );

  bool _isPlaying = false;

  AudioPlayer player = AudioPlayer();

  SongModel get currentSong => _currentSong;
  set currentSong(SongModel song) {
    _currentSong = song;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;
  set isPlaying(bool playing) {
    _isPlaying = playing;
    notifyListeners();
  }

  AudioPlayer get audioPlayer => player;
}
