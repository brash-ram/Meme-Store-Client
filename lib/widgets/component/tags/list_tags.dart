import 'package:flutter/material.dart';

import 'meme_tag.dart';


class ListTags extends StatelessWidget {
  const ListTags({super.key});

  @override
  Widget build(BuildContext context) => const Wrap(
      children: [
        MemeTag(),
        MemeTag(),
        MemeTag(),
        MemeTag(),
        MemeTag(),
      ],
    );
}
