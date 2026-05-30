import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ButtonPageLogin extends StatelessWidget {
  const ButtonPageLogin({super.key});

  static Color pinkApp = Color(0xFFef4138);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double phoneWidth = size.width;

    return Container(
      height: 50,
      width: phoneWidth * 0.5,
      decoration: BoxDecoration(
        color: pinkApp,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            print('Opening music player...');
            Navigator.pushNamed(context, 'playlist');
          },
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedPlaySquare,
            color: Colors.white,
            strokeWidth: 2,
            size: 30,
          ),
        ),
      ),
    );
  }
}
