import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mem_store_client/widgets/screen/feed/widgets/feed.dart';

@RoutePage()
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Feed(),
    );
}
