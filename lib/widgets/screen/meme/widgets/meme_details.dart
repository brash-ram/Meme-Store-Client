import 'package:flutter/cupertino.dart';

import '/widgets/component/asset/meme_image.dart';
import 'meme_author.dart';
import 'meme_description.dart';
import 'meme_tags.dart';

class MemeDetails extends StatelessWidget {
  const MemeDetails({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: [
      SliverList.list(
        children: const [
          MemeImage(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MemeAuthor(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MemeDescription(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MemeTags(),
          ),
        ],
      ),
    ],
  );
}
