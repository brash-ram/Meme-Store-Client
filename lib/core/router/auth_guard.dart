import 'dart:async';

import 'package:auto_route/auto_route.dart';

import '/api.dart';
import 'router.dart';


class AuthGuard extends AutoRouteGuard {
  const AuthGuard(this.api);

  final ApiRepository api;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (api.client.authController.hasAuth) {
      resolver.next(true);
    } else {
      unawaited(
        resolver.redirect(
          AuthRoute(
            onResult: (success) {
              resolver.next(success);
            },
          ),
        ),
      );
    }
  }
}
