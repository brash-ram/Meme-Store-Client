import 'package:dart_mappable/dart_mappable.dart';

import 'telegram_auth_data.dart';

part 'telegram_auth_event.dart';
part 'telegram_event.mapper.dart';


@MappableClass(
  discriminatorKey: 'event',
)
class TelegramEvent with TelegramEventMappable {
  const TelegramEvent({
    required this.event,
  });

  factory TelegramEvent.fromJson(String json) =>
    TelegramEventMapper.fromJson(json);

  final String event;
}
