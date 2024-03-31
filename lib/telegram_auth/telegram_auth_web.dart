// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:js_util' as js_util;
import 'dart:math' as math;

import 'package:web/web.dart';

import 'telegram_auth.dart' as proto;
import 'telegram_auth_exception.dart';
import 'telegram_events.dart';


class TelegramAuth implements proto.TelegramAuth {
  const TelegramAuth({
    required this.botId,
    required this.redirectBaseUri,
    this.useDevHost = false,
  });

  static final _random = math.Random();

  @override
  final Uri redirectBaseUri;
  @override
  final int botId;
  @override
  final bool useDevHost;

  @override
  Future<TelegramAuthData?> auth() async {
    try {
      return await _tryAuth(
        redirectBaseUri.replace(
          queryParameters: {
            ...redirectBaseUri.queryParameters,
            'nonce': _random.nextDouble().toString(),
          },
        ),
      );
    } on TelegramAuthPopupClosedException {
      return null;
    }
  }

  Future<TelegramAuthData> _tryAuth(Uri redirectUri, { String lang = 'en', }) {
    final origin = Uri.parse(window.location.href);
    final returnTo = redirectUri.replace(
      scheme: origin.scheme,
    );
    if (origin.host != returnTo.host)
      return Future.error(
        TelegramAuthException.invalidOriginDomain(
          actual: origin.host,
          expected: redirectUri.host,
        ),
        StackTrace.current,
      );
    final completer = Completer<TelegramAuthData>();
    final authUri = Uri(
      scheme: 'https',
      host: !useDevHost ? 'oauth.telegram.org' : 'oauth.tg.dev',
      path: '/auth',
      queryParameters: <String, String>{
        'bot_id': botId.toString(),
        'origin': origin.toString(),
        'request_access': 'write',
        'lang': lang,
        'return_to': returnTo.toString(),
      },
    );
    final width = 550,
      height = 470,
      left = math.max(0, (window.screen.availWidth - width) / 2),
      top = math.max(0, (window.screen.availHeight - height) / 2);

    late final Window? popup;
    late final Timer timer;
    late final StreamSubscription<MessageEvent> messagesSubscription;

    Future<void> cancelSubscriptions() async {
      timer.cancel();
      await messagesSubscription.cancel();
    }

    messagesSubscription = window.onMessage.listen(
      (event) {
        if (!js_util.equal<JSObject>(event.getProperty('source'.toJS), popup))
          return;
        cancelSubscriptions().ignore();
        try {
          final data = TelegramEvent.fromJson((event.data! as JSString).toDart);
          if (data is! TelegramAuthEvent)
            throw const TelegramAuthException('Invalid event result');
          completer.complete(data.result);
        } catch (error, stackTrace) {
          completer.completeError(error, stackTrace);
        }
      },
    );
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        if (popup?.closed ?? false) {
          cancelSubscriptions().ignore();
          if (!completer.isCompleted)
            completer.completeError(const TelegramAuthException.popupClosed(), StackTrace.current);
        }
      },
    );

    popup = window.open(
      authUri.toString(),
      'Telegram Auth',
      'width=$width,'
      'height=$height,'
      'left=$left,'
      'top=$top,'
      'status=0,'
      'location=0,'
      'menubar=0,'
      'toolbar=0'
    );
    if (popup == null) {
      cancelSubscriptions().ignore();
      completer.completeError(const TelegramAuthException.popupBlocked(), StackTrace.current);
      return completer.future;
    }
    return completer.future;
  }
}
