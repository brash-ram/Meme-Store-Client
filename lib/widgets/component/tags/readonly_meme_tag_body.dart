import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadonlyMemeTagBody extends StatelessWidget {
  const ReadonlyMemeTagBody({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Тэг',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
