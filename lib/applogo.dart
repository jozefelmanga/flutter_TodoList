import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommonLogo extends StatelessWidget {
  // List of asset paths
  final List<String> assetPaths = [
    "../assets/enjoy.png",
    "../assets/fix.png",
    "../assets/learn.png",
    "../assets/pc.png",
    "../assets/girl.png",
  ];

  @override
  Widget build(BuildContext context) {
    // Randomly select an asset path
    final Random random = Random();
    final String randomAssetPath = assetPaths[random.nextInt(assetPaths.length)];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          randomAssetPath,
          width: 300,
          height: 300,
        ),
        "To-Do App".text.xl2.italic.make(),
        "Make A List of your tasks".text.light.white.wider.lg.make(),
      ],
    );
  }
}

