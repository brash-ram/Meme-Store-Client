import 'package:flutter/cupertino.dart';

import '../../../component/asset/meme_image.dart';
import 'meme_tags.dart';

class MemeDetails extends StatelessWidget {
  const MemeDetails({super.key});

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: [
      SliverList.list(
        children: [
          MemeImage(),
          MemeTags(),
          // tags
          // desk
        ],
      ),
    ],
  );
}
