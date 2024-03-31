import 'telegram_events.dart';


interface class TelegramAuth {
  const TelegramAuth({
    required this.botId,
    required this.redirectBaseUri,
    this.useDevHost = false,
  }) : assert(
    false,
    'Attempted to instantiate base implementation. '
    'You must be missing platform import.',
  );

  final Uri redirectBaseUri;
  final int botId;
  final bool useDevHost;

  Future<TelegramAuthData?> auth() => throw UnimplementedError(
    'Stub code called.',
  );
}
