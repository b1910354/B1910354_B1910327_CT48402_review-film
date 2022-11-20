import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 94.0,
      ),
      // transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 245, 130, 8).withOpacity(0.9),
            const Color.fromARGB(255, 171, 8, 235).withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 1],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        'Review Film',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'Anton',
          fontWeight: FontWeight.w300,
          letterSpacing: 2,
          wordSpacing: 4,
        ),
      ),
    );
  }
}
