import 'package:auto_route/auto_route.dart';

import '../../widgets/screen/add_meme/add_meme_screen.dart';
import '../../widgets/screen/feed/feed_screen.dart';
import '../../widgets/screen/home/home_screen.dart';
import '../../widgets/screen/profile/profile_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeShopRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: FeedRoute.page, path: 'feed', initial: true),
        AutoRoute(page: AddMemeRoute.page, path: 'addMeme'),
        AutoRoute(page: ProfileRoute.page, path: 'profile')
      ]
    ),
  ];
}