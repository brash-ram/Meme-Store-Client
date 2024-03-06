import 'package:flutter/material.dart';

import '../asset/meme_image.dart';
import '../tags/list_tags.dart';


class MemeCard extends StatelessWidget {
  const MemeCard({super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          MemeImage(),
          Text(
            "Название мема",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).primaryColor
            ),
            maxLines: 2,
          ),
          ListTags()
        ],
      )
  );
}
