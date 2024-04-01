import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '/api.dart';
import '/core/router/router.dart';
import '/data_layer_library.dart';
import '/logging.dart';

import '/telegram_auth/telegram_auth.dart';


class AuthInProgressCubit extends Cubit<({bool hasAuth, bool isAuthenticating})> {
  AuthInProgressCubit([ super.initialState = (hasAuth: false, isAuthenticating: false), ]);

  void beginAuth() => emit((hasAuth: state.hasAuth, isAuthenticating: true));
  void endAuth([ bool? hasAuth ]) => emit((hasAuth: hasAuth ?? state.hasAuth, isAuthenticating: false));
}

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
    this.onResult,
  });

  final void Function(bool)? onResult;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _controller = PhotoViewController();

  @override
  void initState() {
    super.initState();
    if (context.read<ApiClient>().authController.hasAuth) {
      talker.verbose('Authentication skipped');
      unawaited(_onAuthDone());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onAuthDone() async {
    if (widget.onResult case final callback?) {
      callback(true);
    } else
      if (mounted)
        await context.replaceRoute(const HomeShopRoute());
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium ?? DefaultTextStyle.of(context).style;
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: const Text('Sing in'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => AuthInProgressCubit(
              (
                hasAuth: context.read<ApiClient>().authController.hasAuth,
                isAuthenticating: false,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    strutStyle: StrutStyle.fromTextStyle(textStyle),
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: textStyle,
                          text: 'Please sign-in via ',
                        ),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(Icons.telegram),
                        ),
                        TextSpan(
                          style: textStyle,
                          text: ' Telegram.',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<AuthInProgressCubit, ({bool hasAuth, bool isAuthenticating})>(
                    listener: (context, state) async {
                      if (state.hasAuth)
                        await _onAuthDone();
                    },
                    builder: (context, state) =>
                      ElevatedButton.icon(
                        icon: state.isAuthenticating
                          ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                          : const Icon(Icons.telegram),
                        label: const Text('Sign in via Telegram'),
                        onPressed: state.isAuthenticating ? null : () async {
                          final tg = context.read<TelegramAuth>();
                          final api = context.read<ApiClient>();
                          final authInProgress = context.read<AuthInProgressCubit>()
                            ..beginAuth();
                          try {
                            final tgAuth = await tg.auth();
                            if (tgAuth == null) {
                              talker.warning('Authentication canceled');
                              return;
                            }
                            final auth = await api.auth(
                              tgAuth.id,
                              RequestBodyAuth(
                                fullName: tgAuth.fullName,
                                username: tgAuth.username ?? 'TGUser-${tgAuth.id}',
                              ),
                            );
                            api.authController.setAuth(
                              tgAuth,
                              auth.accessToken,
                            );
                            talker.info('Authentication successful');
                          } catch (error, stackTrace) {
                            talker.warning('Authentication failed', error, stackTrace);
                          } finally {
                            authInProgress.endAuth(api.authController.hasAuth);
                          }
                        },
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
