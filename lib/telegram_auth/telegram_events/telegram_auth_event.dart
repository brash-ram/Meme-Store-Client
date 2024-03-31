part of 'telegram_event.dart';


@MappableClass(
  discriminatorValue: 'auth_result',
)
final class TelegramAuthEvent extends TelegramEvent with TelegramAuthEventMappable {
  const TelegramAuthEvent({
    required super.event,
    required this.result,
    required this.origin,
  });

  final TelegramAuthData result;
  final String origin;
}
