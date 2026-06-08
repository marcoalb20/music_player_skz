import 'package:flutter/material.dart';
import 'package:music_player_skz/providers/page_provider.dart';

class BgContainerDetail extends StatelessWidget {
  const BgContainerDetail({super.key});

  static PageProvider pageProvider = PageProvider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            pageProvider.redColorApp,
            Color.fromARGB(129, 18, 18, 18),
            Color(0xFF121212),
          ],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
