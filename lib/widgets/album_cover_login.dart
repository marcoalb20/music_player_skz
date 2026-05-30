import 'package:flutter/material.dart';

class AlbumCoverLogin extends StatelessWidget {
  const AlbumCoverLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [GradientALbumCover(), BlurAlbumCover(), ContentAlbumCover()],
      ),
    );
  }
}

class ContentAlbumCover extends StatelessWidget {
  const ContentAlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double phoneWidth = size.width;
    return Center(
      child: Container(
        width: phoneWidth * 0.6,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/album.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GO生 GO LIVE',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoSansJP',
                      ),
                    ),
                    Text(
                      'Stray Kids - Full Album',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NotoSansJP',
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlurAlbumCover extends StatelessWidget {
  const BlurAlbumCover({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double phoneWidth = size.width;
    return Center(
      child: Container(
        width: phoneWidth * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.15),
        ),
      ),
    );
  }
}

class GradientALbumCover extends StatelessWidget {
  const GradientALbumCover({super.key});

  static Color pinkApp = Color(0xFFef4138);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double phoneWidth = size.width;
    return Center(
      child: Container(
        width: phoneWidth * 0.6,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
          gradient: LinearGradient(
            colors: [pinkApp, Colors.black, Colors.black],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
