import 'package:dart_mappable/dart_mappable.dart';

part 'telegram_auth_data.mapper.dart';


class _AuthDateHook extends MappingHook {
  const _AuthDateHook();

  @override
  Object? beforeDecode(Object? value) => switch(value) {
    final int value => value * 1000,
    _ => value,
  };
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class TelegramAuthData with TelegramAuthDataMappable {
  const TelegramAuthData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.photoUrl,
    required this.authDate,
    required this.hash,
  });

  final int id;
  final String firstName;
  final String? lastName;
  final String? username;
  final String? photoUrl;
  @MappableField(hook: _AuthDateHook())
  final DateTime authDate;
  final String hash;

  String get fullName => '$firstName $lastName'.trim();
}
