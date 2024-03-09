import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'widgets/meme_widget.dart';

@RoutePage()
class MemeScreen extends StatelessWidget {
  const MemeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          "Название мема",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: const MemeWidget(),
    );
}
