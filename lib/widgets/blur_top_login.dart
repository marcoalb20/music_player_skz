import 'package:flutter/material.dart';

class BlurTopLogin extends StatelessWidget {
  const BlurTopLogin({super.key});

  static Color pinkApp = Color(0xFFef4138);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      right: 0,
      left: 0,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: pinkApp,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(color: pinkApp, blurRadius: 90, spreadRadius: 100),
            ],
          ),
        ),
      ),
    );
  }
}
