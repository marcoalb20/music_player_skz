import 'package:flutter/material.dart';

class PopButtonDetail extends StatelessWidget {
  const PopButtonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF121212),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow()],
          ),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
