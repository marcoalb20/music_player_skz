import 'package:flutter/material.dart';
import 'package:music_player_skz/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF121212),
        body: Stack(
          children: [BgContainerDetail(), SongDetail(), PopButtonDetail()],
        ),
      ),
    );
  }
}
