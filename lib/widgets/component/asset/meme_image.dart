import 'package:flutter/material.dart';

class MemeImage extends StatelessWidget {
  const MemeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        "assets/images/troll_face.png",
    );
  }
}
