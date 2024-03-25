import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/core/router/router.dart';
import '/core/style/icons.dart';
import 'widget/bottom_navigation_bar_item.dart';


@RoutePage()
class HomeShopScreen extends StatefulWidget {
  const HomeShopScreen({ super.key, });

  @override
  State<HomeShopScreen> createState() => _HomeShopScreenState();
}

class _HomeShopScreenState extends State<HomeShopScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const AutoLeadingButton(showIfChildCanPop: false),
      title: const Text('Meme Store'),
    ),
    body: AutoTabsScaffold(
      routes: const [
        FeedRoute(),
        AddMemeRoute(),
        MyProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        selectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New meme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My profile',
          ),
        ],
      ),
    ),
  );
}
