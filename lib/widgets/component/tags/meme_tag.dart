import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/style/icons.dart';
import 'meme_tag_body.dart';
import 'readonly_meme_tag_body.dart';

class MemeTag extends StatelessWidget {
  const MemeTag({super.key, this.readonly = true});

  final bool readonly;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 4),
    child: Chip(
        labelPadding: EdgeInsets.zero,
        label: readonly ? const ReadonlyMemeTagBody() : const MemeTagBody(),
    ),
  );
}
