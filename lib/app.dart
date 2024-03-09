import 'package:flutter/material.dart';

import 'core/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Meme Store',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue
          )
      ),
      routerConfig: appRouter.config(),
    );
  }
}
