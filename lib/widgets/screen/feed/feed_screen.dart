import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../data.dart';
import 'widgets/feed.dart';

@RoutePage()
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController
      .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: TabBar(
        controller: _tabController,
        tabs: const <Widget>[
          Tab(
            child: Text(
              'Последние',
            ),
          ),
          Tab(
            child: Text(
                'Рекомендованные',
            ),
          ),
        ],
      ),
    ),
    body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            Feed(type: FeedType.latest),
            Feed(type: FeedType.recommended),
          ],
        ),
    )
  );
}
