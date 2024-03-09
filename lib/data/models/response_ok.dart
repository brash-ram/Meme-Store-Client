part of 'response.dart';


@MappableClass(discriminatorValue: ResponseOk._checkType)
final class ResponseOk<T> extends Response<T> with ResponseOkMappable<T> {
  const ResponseOk({
    required this.result,
    this.related,
  }) : super(isError: false);

  static bool _checkType(dynamic value) => switch(value) {
    {
      'error': false,
      'result': Object(),
    } => true,
    _ => false,
  };

  @MappableField(key: 'result')
  final T result;

  @MappableField(key: 'related')
  final Object? related;
}
