class SongModel {
  final String title;
  final String durationString;
  final String url;
  bool isFavorite;

  SongModel({
    required this.title,
    required this.durationString,
    required this.url,
    this.isFavorite = false,
  });
}
