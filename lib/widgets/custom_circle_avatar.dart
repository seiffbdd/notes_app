import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar(
      {super.key, required this.isPicked, required this.color});
  final bool isPicked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    if (isPicked) {
      return CircleAvatar(
        radius: 38,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: color,
        ),
      );
    } else {
      return CircleAvatar(
        radius: 34,
        backgroundColor: color,
      );
    }
  }
}
