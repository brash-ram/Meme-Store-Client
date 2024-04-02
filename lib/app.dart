import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'api.dart';
import 'core/app_scroll_behavior.dart';
import 'core/http/client_stub.dart'
  if (dart.library.io) 'core/http/client_io.dart'
  if (dart.library.js) 'core/http/client_web.dart';
import 'core/router/auth_guard.dart';
import 'core/router/router.dart';
import 'logging.dart';

import 'telegram_auth/telegram_auth.dart'
  if (dart.library.js_interop) 'telegram_auth/telegram_auth_web.dart' as telegram_auth_impl;
import 'telegram_auth/telegram_auth.dart' as telegram_auth;
// import 'telegram_auth/telegram_events.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) =>
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<telegram_auth.TelegramAuth>.value(
          value: telegram_auth_impl.TelegramAuth(
            botId: 6728196094,
            redirectBaseUri: Uri.https('meme-store.null.moe', '/web_auth'),
          ),
        ),
        RepositoryProvider.value(
          value: talker,
        ),
        RepositoryProvider(
          create: (context) => createClient(),
        ),
        RepositoryProvider(
          create: (context) => AuthController(),
        ),
        RepositoryProvider(
          create: (context) => ApiClient(
            baseUri: Uri.https('meme-store.null.moe', 'api/v1'),
            // baseUri: Uri.http('127.0.0.1:8080', 'api/v1'),
            client: context.read(),
            authController: context.read(),
          ),
          // ..authController.setAuth(
          //   TelegramAuthData(
          //     id: -1,
          //     authDate: DateTime.now(),
          //     firstName: 'Debug',
          //     lastName: 'User',
          //     hash: '',
          //     photoUrl: null,
          //     username: 'DebugTgUser',
          //   ),
          //   'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWQiOjIsInJvbGVzIjpbIlVTRVJfUk9MRSJdLCJleHAiOjI3OTE2MDkyNTB9.iYTHjjqe2rCBvxbpOSHAbe6m-8_uP9reTi7Zx49hNJIy31xXJeOtB844oNXu9FjXYctCuxW7HVEnmHCT4hagFw',
          // ),
        ),
        RepositoryProvider(
          create: (context) => ApiRepository(
            client: context.read(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          final appRouter = AppRouter(
            authGuard: AuthGuard(context.read()),
          );
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            scrollBehavior: const AppScrollBehavior(),
            title: 'Meme Store',
            theme: FlexThemeData.light(
              scheme: FlexScheme.indigo,
              useMaterial3: true,
            ),
            darkTheme: FlexThemeData.dark(
              scheme: FlexScheme.indigo,
              useMaterial3: true,
            ),
            routerConfig: appRouter.config(
              navigatorObservers: () => [
                TalkerRouteObserver(talker),
              ],
            ),
          );
        },
      ),
    );
}
