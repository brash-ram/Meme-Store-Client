// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'telegram_event.dart';

class TelegramEventMapper extends ClassMapperBase<TelegramEvent> {
  TelegramEventMapper._();

  static TelegramEventMapper? _instance;
  static TelegramEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TelegramEventMapper._());
      TelegramAuthEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TelegramEvent';

  static String _$event(TelegramEvent v) => v.event;
  static const Field<TelegramEvent, String> _f$event = Field('event', _$event);

  @override
  final MappableFields<TelegramEvent> fields = const {
    #event: _f$event,
  };

  static TelegramEvent _instantiate(DecodingData data) {
    return TelegramEvent(event: data.dec(_f$event));
  }

  @override
  final Function instantiate = _instantiate;

  static TelegramEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TelegramEvent>(map);
  }

  static TelegramEvent fromJson(String json) {
    return ensureInitialized().decodeJson<TelegramEvent>(json);
  }
}

mixin TelegramEventMappable {
  String toJson() {
    return TelegramEventMapper.ensureInitialized()
        .encodeJson<TelegramEvent>(this as TelegramEvent);
  }

  Map<String, dynamic> toMap() {
    return TelegramEventMapper.ensureInitialized()
        .encodeMap<TelegramEvent>(this as TelegramEvent);
  }

  @override
  String toString() {
    return TelegramEventMapper.ensureInitialized()
        .stringifyValue(this as TelegramEvent);
  }
}

class TelegramAuthEventMapper extends SubClassMapperBase<TelegramAuthEvent> {
  TelegramAuthEventMapper._();

  static TelegramAuthEventMapper? _instance;
  static TelegramAuthEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TelegramAuthEventMapper._());
      TelegramEventMapper.ensureInitialized().addSubMapper(_instance!);
      TelegramAuthDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TelegramAuthEvent';

  static String _$event(TelegramAuthEvent v) => v.event;
  static const Field<TelegramAuthEvent, String> _f$event =
      Field('event', _$event);
  static TelegramAuthData _$result(TelegramAuthEvent v) => v.result;
  static const Field<TelegramAuthEvent, TelegramAuthData> _f$result =
      Field('result', _$result);
  static String _$origin(TelegramAuthEvent v) => v.origin;
  static const Field<TelegramAuthEvent, String> _f$origin =
      Field('origin', _$origin);

  @override
  final MappableFields<TelegramAuthEvent> fields = const {
    #event: _f$event,
    #result: _f$result,
    #origin: _f$origin,
  };

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'auth_result';
  @override
  late final ClassMapperBase superMapper =
      TelegramEventMapper.ensureInitialized();

  static TelegramAuthEvent _instantiate(DecodingData data) {
    return TelegramAuthEvent(
        event: data.dec(_f$event),
        result: data.dec(_f$result),
        origin: data.dec(_f$origin));
  }

  @override
  final Function instantiate = _instantiate;

  static TelegramAuthEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TelegramAuthEvent>(map);
  }

  static TelegramAuthEvent fromJson(String json) {
    return ensureInitialized().decodeJson<TelegramAuthEvent>(json);
  }
}

mixin TelegramAuthEventMappable {
  String toJson() {
    return TelegramAuthEventMapper.ensureInitialized()
        .encodeJson<TelegramAuthEvent>(this as TelegramAuthEvent);
  }

  Map<String, dynamic> toMap() {
    return TelegramAuthEventMapper.ensureInitialized()
        .encodeMap<TelegramAuthEvent>(this as TelegramAuthEvent);
  }

  @override
  String toString() {
    return TelegramAuthEventMapper.ensureInitialized()
        .stringifyValue(this as TelegramAuthEvent);
  }
}
