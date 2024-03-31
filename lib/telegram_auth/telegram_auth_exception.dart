sealed class TelegramAuthException implements Exception {
  const factory TelegramAuthException(
    String message, [
      Exception? innerException,
    ]
  ) = _TelegramAuthException;

  const factory TelegramAuthException.popupBlocked() = TelegramAuthPopupBlockedException;
  const factory TelegramAuthException.popupClosed() = TelegramAuthPopupClosedException;
  const factory TelegramAuthException.invalidOriginDomain({
    required String expected,
    required String actual,
  }) = TelegramAuthInvalidOriginDomainException;

  const TelegramAuthException._();

  String get message;

  @override
  String toString() => 'TelegramAuthException: $message';
}

final class _TelegramAuthException extends TelegramAuthException {
  const _TelegramAuthException(this.message, [ this.innerException, ]) : super._();

  final Exception? innerException;
  @override
  final String message;

  @override
  String toString() => 'TelegramAuthException: $message${
    innerException == null
      ? ''
      : ' caused by: $innerException'}';
}


class TelegramAuthPopupBlockedException extends TelegramAuthException {
  const TelegramAuthPopupBlockedException() : super._();

  @override
  String get message => 'Popups are blocked. User must first interact with the app.';
}

class TelegramAuthPopupClosedException extends TelegramAuthException {
  const TelegramAuthPopupClosedException() : super._();

  @override
  String get message => 'Popup was closed before result received.';
}


class TelegramAuthInvalidOriginDomainException extends TelegramAuthException {
  const TelegramAuthInvalidOriginDomainException({
    required this.expected,
    required this.actual,
  }) : super._();

  final String expected;
  final String actual;

  @override
  String get message => 'Cannot authenticate due to invalid origin domain: '
    'expected "$expected", got "$actual".';
}
