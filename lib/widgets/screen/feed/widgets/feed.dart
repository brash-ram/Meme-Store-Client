import 'package:flutter/material.dart';

import '../../../component/meme/meme_card.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(child: MemeCard()),
          Expanded(child: MemeCard()),
        ],
      ),
    );
}
