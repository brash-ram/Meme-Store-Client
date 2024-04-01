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
    AssetRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AssetRouteArgs>(
          orElse: () => AssetRouteArgs(assetId: pathParams.getInt('assetId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AssetScreen(
          assetId: args.assetId,
          key: args.key,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthScreen(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    BanRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BanScreen(),
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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MemeRouteArgs>(
          orElse: () => MemeRouteArgs(
                galleryId: pathParams.getInt('galleryId'),
                memeId: pathParams.getInt('memeId'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MemeScreen(
          galleryId: args.galleryId,
          memeId: args.memeId,
          key: args.key,
        ),
      );
    },
    MyProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyProfileScreen(),
      );
    },
    TenantProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TenantProfileRouteArgs>(
          orElse: () => TenantProfileRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TenantProfileScreen(
          id: args.id,
          key: args.key,
        ),
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
/// [AssetScreen]
class AssetRoute extends PageRouteInfo<AssetRouteArgs> {
  AssetRoute({
    required int assetId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AssetRoute.name,
          args: AssetRouteArgs(
            assetId: assetId,
            key: key,
          ),
          rawPathParams: {'assetId': assetId},
          initialChildren: children,
        );

  static const String name = 'AssetRoute';

  static const PageInfo<AssetRouteArgs> page = PageInfo<AssetRouteArgs>(name);
}

class AssetRouteArgs {
  const AssetRouteArgs({
    required this.assetId,
    this.key,
  });

  final int assetId;

  final Key? key;

  @override
  String toString() {
    return 'AssetRouteArgs{assetId: $assetId, key: $key}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [BanScreen]
class BanRoute extends PageRouteInfo<void> {
  const BanRoute({List<PageRouteInfo>? children})
      : super(
          BanRoute.name,
          initialChildren: children,
        );

  static const String name = 'BanRoute';

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
class MemeRoute extends PageRouteInfo<MemeRouteArgs> {
  MemeRoute({
    required int galleryId,
    required int memeId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MemeRoute.name,
          args: MemeRouteArgs(
            galleryId: galleryId,
            memeId: memeId,
            key: key,
          ),
          rawPathParams: {
            'galleryId': galleryId,
            'memeId': memeId,
          },
          initialChildren: children,
        );

  static const String name = 'MemeRoute';

  static const PageInfo<MemeRouteArgs> page = PageInfo<MemeRouteArgs>(name);
}

class MemeRouteArgs {
  const MemeRouteArgs({
    required this.galleryId,
    required this.memeId,
    this.key,
  });

  final int galleryId;

  final int memeId;

  final Key? key;

  @override
  String toString() {
    return 'MemeRouteArgs{galleryId: $galleryId, memeId: $memeId, key: $key}';
  }
}

/// generated route for
/// [MyProfileScreen]
class MyProfileRoute extends PageRouteInfo<void> {
  const MyProfileRoute({List<PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TenantProfileScreen]
class TenantProfileRoute extends PageRouteInfo<TenantProfileRouteArgs> {
  TenantProfileRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TenantProfileRoute.name,
          args: TenantProfileRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'TenantProfileRoute';

  static const PageInfo<TenantProfileRouteArgs> page =
      PageInfo<TenantProfileRouteArgs>(name);
}

class TenantProfileRouteArgs {
  const TenantProfileRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'TenantProfileRouteArgs{id: $id, key: $key}';
  }
}
