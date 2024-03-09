import 'package:flutter/cupertino.dart';

import '../../../component/asset/meme_image.dart';

class MemeWidget extends StatelessWidget {
  const MemeWidget({super.key});

  @override
  Widget build(BuildContext context) => ListView(
      children: [
        MemeImage()
      ],
    );
}
