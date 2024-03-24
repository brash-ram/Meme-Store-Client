import 'package:flutter/material.dart';

import '/data_layer_library.dart';


class MemeCardTag extends StatelessWidget {
  const MemeCardTag({
    required this.tag,
    super.key,
  });

  final MemeTag tag;

  @override
  Widget build(BuildContext context) => Text.rich(
    overflow: TextOverflow.ellipsis,
    TextSpan(
      style: TextStyle(
        color: Theme.of(context).primaryColor,
      ),
      children: [
        const TextSpan(text: '#'),
        TextSpan(text: tag.name),
      ],
    ),
  );
}
