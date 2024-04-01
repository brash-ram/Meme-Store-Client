import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/screen/add_meme/add_meme_screen.dart';
import '../../widgets/screen/asset/asset_screen.dart';
import '../../widgets/screen/auth_screen/auth_screen.dart';
import '../../widgets/screen/feed/feed_screen.dart';
import '../../widgets/screen/gallery/gallery_screen.dart';
import '../../widgets/screen/home/home_screen.dart';
import '../../widgets/screen/logs/logs_screen.dart';
import '../../widgets/screen/ban/ban_screen.dart';
import '../../widgets/screen/meme/meme_screen.dart';
import '../../widgets/screen/my_profile/my_profile_screen.dart';
import '../../widgets/screen/tenant_profile/tenant_profile_screen.dart';
import 'auth_guard.dart';

part 'router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter({
    required this.authGuard,
    super.navigatorKey,
  });

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/auth',
      initial: true,
      page: AuthRoute.page,
    ),
    AutoRoute(
      path: '/ban',
      page: BanRoute.page,
      guards: [ authGuard, ],
    ),
    AutoRoute(
      page: LogsRoute.page,
      path: '/logs',
      guards: [ authGuard, ],
    ),
    AutoRoute(
      page: HomeShopRoute.page,
      path: '/home',
      guards: [ authGuard, ],
      children: [
        AutoRoute(page: FeedRoute.page, path: 'feed', initial: true),
        AutoRoute(page: AddMemeRoute.page, path: 'addMeme'),
        AutoRoute(page: MyProfileRoute.page, path: 'profile'),
      ],
    ),
    AutoRoute(
      page: MemeRoute.page,
      path: '/gallery/:galleryId/:memeId',
      guards: [ authGuard, ],
    ),
    AutoRoute(
      page: AssetRoute.page,
      path: '/asset/:assetId',
      guards: [ authGuard, ],
    ),
    AutoRoute(
      page: TenantProfileRoute.page,
      path: '/tenant/:id/profile',
      guards: [ authGuard, ],
    ),
    AutoRoute(
      page: GalleryRoute.page,
      path: '/gallery/:galleryId',
      guards: [ authGuard, ],
    ),
  ];
}
