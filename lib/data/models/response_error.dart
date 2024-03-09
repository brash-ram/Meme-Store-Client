part of 'response.dart';


@MappableClass(discriminatorValue: ResponseError._checkType)
final class ResponseError extends Response<Never> with ResponseErrorMappable {
  const ResponseError({
    required this.code,
    required this.message,
  }) : super(isError: true);

  static bool _checkType(dynamic value) => switch(value) {
    {
      'error': true,
      'message': String(),
    } => true,
    _ => false,
  };

  @MappableField(key: 'code')
  final int code;
  @MappableField(key: 'message')
  final String message;
}
