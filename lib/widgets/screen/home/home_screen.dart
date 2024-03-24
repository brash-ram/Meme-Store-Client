import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../my_profile/my_profile_screen.dart';
import '/core/router/router.dart';
import '/core/style/icons.dart';
import 'widget/bottom_navigation_bar_item.dart';

@RoutePage()
class HomeShopScreen extends StatefulWidget {
  const HomeShopScreen({super.key});

  @override
  State<HomeShopScreen> createState() => _HomeShopScreenState();
}

class _HomeShopScreenState extends State<HomeShopScreen> {
  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
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
      items: [
        CustomBottomNavigationBarItem.build(
          iconHome,
          'Лента',
          context,
        ),
        CustomBottomNavigationBarItem.build(
          iconAdd,
          'Добавить',
          context,
        ),
        CustomBottomNavigationBarItem.build(
          iconProfile,
          'Профиль',
          context,
        ),
      ],
    ),
  );
}
