import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'api.dart';
import 'core/app_scroll_behaviour.dart';
import 'core/http/client_stub.dart'
  if (dart.library.io) 'core/http/client_io.dart'
  if (dart.library.js) 'core/http/client_web.dart';
import 'core/router/router.dart';
import 'logging.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiRepositoryProvider(
      providers: [
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
            baseUri: Uri.http('127.0.0.1:8080', 'api/v1'),
            client: context.read(),
            authController: context.read(),
          )..authController.token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxIiwiaWQiOjIsInJvbGVzIjpbIlVTRVJfUk9MRSJdLCJleHAiOjE3MTEyMjQxMTV9.szOxzWrEUm7MqibtoDSjwgnR2lviodvsWHxMlbqqwwJSDRi0rYc4gFLteRRwCXz3LW-nhwaVNsxKYA1_1z8aKQ',
        ),
        RepositoryProvider(
          create: (context) => ApiRepository(
            client: context.read(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const AppScrollBehavior(),
        title: 'Meme Store',
        theme: FlexThemeData.light(scheme: FlexScheme.indigo),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.indigo),
        routerConfig: appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(talker),
          ],
        ),
      ),
    );
  }
}
