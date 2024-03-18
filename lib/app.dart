import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'api.dart';
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
          ),
        ),
        RepositoryProvider(
          create: (context) => ApiRepository(
            client: context.read(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Meme Store',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
        ),
        routerConfig: appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(talker),
          ],
        ),
      ),
    );
  }
}
