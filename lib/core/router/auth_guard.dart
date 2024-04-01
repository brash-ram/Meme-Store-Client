import 'dart:async';

import 'package:auto_route/auto_route.dart';

import '/api.dart';
import 'router.dart';


class AuthGuard extends AutoRouteGuard {
  const AuthGuard(this.api);

  final ApiRepository api;

  static const bannedUsers = [
    1013591342,
  ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (api.client.authController.hasAuth) {
      if (_checkBan(resolver))
        return;
      return resolver.next(true);
    } 
    return unawaited(
      resolver.redirect(
        AuthRoute(
          onResult: (success) {
            if (_checkBan(resolver))
              return;
            resolver.next(success);
          },
        ),
      ),
    );
  }

  bool _checkBan(NavigationResolver resolver) {
    if (bannedUsers.contains(api.client.authController.token?.$1.id) && resolver.route.name != BanRoute.name) {
      unawaited(
        resolver.redirect<void>(
          const BanRoute(),
          replace: true,
        ),
      );
      return true;
    }
    return false;
  }
}
