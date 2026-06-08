import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_skz/models/song_model.dart';
import 'package:music_player_skz/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongsProvider extends ChangeNotifier {
  // VARIBLES

  static final List<SongModel> _songsItems = [
    SongModel(
      title: 'GO LIVE',
      durationString: '1:51',
      url: 'assets/sounds/cancion_1.mp3',
    ),
    SongModel(
      title: "God's Menu",
      durationString: '3:07',
      url: 'assets/sounds/cancion_2.mp3',
    ),
    SongModel(
      title: 'Easy',
      durationString: '3:04',
      url: 'assets/sounds/cancion_3.mp3',
    ),
    SongModel(
      title: 'Pacemaker',
      durationString: '3:11',
      url: 'assets/sounds/cancion_4.mp3',
    ),
    SongModel(
      title: 'Airplane',
      durationString: '3:35',
      url: 'assets/sounds/cancion_5.mp3',
    ),
    SongModel(
      title: 'Another Day',
      durationString: '2:47',
      url: 'assets/sounds/cancion_6.mp3',
    ),
    SongModel(
      title: 'Phobia',
      durationString: '3:33',
      url: 'assets/sounds/cancion_7.mp3',
    ),
    SongModel(
      title: 'Blueprint',
      durationString: '4:12',
      url: 'assets/sounds/cancion_8.mp3',
    ),
    SongModel(
      title: 'TA',
      durationString: '3:29',
      url: 'assets/sounds/cancion_9.mp3',
    ),
    SongModel(
      title: 'Haven',
      durationString: '3:19',
      url: 'assets/sounds/cancion_10.mp3',
    ),
    SongModel(
      title: 'TOP',
      durationString: '3:17',
      url: 'assets/sounds/cancion_11.mp3',
    ),
    SongModel(
      title: 'SLUMP',
      durationString: '2:15',
      url: 'assets/sounds/cancion_12.mp3',
    ),
    SongModel(
      title: 'Mixtape : Gone Days',
      durationString: '3:23',
      url: 'assets/sounds/cancion_13.mp3',
    ),
    SongModel(
      title: 'Mixtape : On Track',
      durationString: '3:34',
      url: 'assets/sounds/cancion_14.mp3',
    ),
  ];

  SongModel _currentSong = SongModel(
    title: 'Selecciona una canción',
    durationString: '0:00',
    url: '',
  );

  bool _isPlaying = false;
  final AudioPlayer _player = AudioPlayer();
  double _progress = 0.0;
  bool _random = false;
  List<int> _randomPlaylist = [];
  static const String _favsKey = 'favorite_songs_urls';

  List<SongModel> get songsItems => _songsItems;

  SongModel get currentSong => _currentSong;
  set currentSong(SongModel song) {
    _currentSong = song;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;
  AudioPlayer get audioPlayer => _player;
  double get progress => _progress;
  bool get random => _random;

  SongsProvider() {
    _initListeners();
    _loadFavorites();
  }

  // FUNCIONES INICIALES

  void _initListeners() {
    _player.positionStream.listen((position) {
      final duration = _player.duration;

      if (duration != null && duration.inMilliseconds > 0) {
        _progress = (position.inMilliseconds / duration.inMilliseconds).clamp(
          0.0,
          1.0,
        );
        notifyListeners();
      }
    });

    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        Future.delayed(Duration(milliseconds: 300), () {
          nextSongButton();
        });
      }
    });
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> favoriteUrls = prefs.getStringList(_favsKey) ?? [];

      if (favoriteUrls.isNotEmpty) {
        for (var song in _songsItems) {
          if (favoriteUrls.contains(song.url)) {
            song.isFavorite = true;
          }
        }
        notifyListeners();
      }
    } catch (e) {
      print("Error al cargar favoritos: $e");
    }
  }

  List<int> get _activePlaylist {
    return _random
        ? _randomPlaylist
        : List.generate(_songsItems.length, (i) => i);
  }

  void generateRandomPlaylist() {
    _randomPlaylist = List.generate(_songsItems.length, (i) => i);
    _randomPlaylist.shuffle();
  }

  void changeRandomState() {
    _random = !_random;
    if (_random) generateRandomPlaylist();
    print('Estado del random: $_random');
    notifyListeners();
  }

  void changePlayState() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void addFavorite(SongModel song) async {
    song.isFavorite = !song.isFavorite;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> favoriteUrls = prefs.getStringList(_favsKey) ?? [];

      if (song.isFavorite) {
        if (!favoriteUrls.contains(song.url)) {
          favoriteUrls.add(song.url);
        }
      } else {
        favoriteUrls.remove(song.url);
      }

      await prefs.setStringList(_favsKey, favoriteUrls);
    } catch (e) {
      print("Error al guardar favorito: $e");
    }
  }

  void playNewAudio() async {
    await _player.stop();
    _progress = 0.0;
    await _player.setAsset(_currentSong.url);
    await _player.play();
    notifyListeners();
  }

  // FUNCIONES COMPUESTAS

  void playNewListSong(SongModel newSongModel) {
    _currentSong = newSongModel;
    changePlayState();
    playNewAudio();
  }

  void playInitialSong() {
    _player.stop();
    _currentSong = _songsItems[0];
    _player.setAsset(_currentSong.url);
    _progress = 0.0;
    _player.play();
  }

  // FUNCIONES BOTONES

  void playButtonAction() {
    if (_currentSong.url.isNotEmpty) {
      _player.play();
    } else {
      playInitialSong();
    }
    changePlayState();
  }

  void continueButtonAction() {
    if (_isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    changePlayState();
  }

  void detailButtonAction(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (_, _, _) => DetailScreen(),
        transitionsBuilder: (_, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void playlistButtonAction(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (_, _, _) => PlaylistScreen(),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  List<List<dynamic>> continueButtonIcon() {
    if (_isPlaying) {
      return HugeIcons.strokeRoundedPauseCircle;
    } else {
      return HugeIcons.strokeRoundedPlayCircle;
    }
  }

  void nextSongButton() {
    final playlist = _activePlaylist;
    final currentIndex = playlist.indexOf(_songsItems.indexOf(_currentSong));
    final nextIndex = (currentIndex + 1) % playlist.length;
    _currentSong = _songsItems[playlist[nextIndex]];
    playNewAudio();
  }

  void previousSongButton() {
    if (_progress > 0.05) {
      playNewAudio();
      return;
    }
    final playlist = _activePlaylist;
    final currentIndex = playlist.indexOf(_songsItems.indexOf(_currentSong));
    final prevIndex = (currentIndex - 1 + playlist.length) % playlist.length;
    _currentSong = _songsItems[playlist[prevIndex]];
    playNewAudio();
  }

  void seekToProgress(double percentage) {
    final duration = _player.duration;

    if (duration != null) {
      final newMilliseconds = duration.inMilliseconds * percentage;
      final newPosition = Duration(milliseconds: newMilliseconds.toInt());
      _player.seek(newPosition);
    }
  }
}
