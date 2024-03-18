// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddMemeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddMemeScreen(),
      );
    },
    FeedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedScreen(),
      );
    },
    HomeShopRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeShopScreen(),
      );
    },
    LogsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogsScreen(),
      );
    },
    MemeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MemeScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
  };
}

/// generated route for
/// [AddMemeScreen]
class AddMemeRoute extends PageRouteInfo<void> {
  const AddMemeRoute({List<PageRouteInfo>? children})
      : super(
          AddMemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMemeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedScreen]
class FeedRoute extends PageRouteInfo<void> {
  const FeedRoute({List<PageRouteInfo>? children})
      : super(
          FeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeShopScreen]
class HomeShopRoute extends PageRouteInfo<void> {
  const HomeShopRoute({List<PageRouteInfo>? children})
      : super(
          HomeShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeShopRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogsScreen]
class LogsRoute extends PageRouteInfo<void> {
  const LogsRoute({List<PageRouteInfo>? children})
      : super(
          LogsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MemeScreen]
class MemeRoute extends PageRouteInfo<void> {
  const MemeRoute({List<PageRouteInfo>? children})
      : super(
          MemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MemeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
