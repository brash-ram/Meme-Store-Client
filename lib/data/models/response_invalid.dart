part of 'response.dart';


@MappableClass(
  discriminatorValue: MappableClass.useAsDefault,
  hook: _ResponseInvalidHook(),
)
final class ResponseInvalid extends Response<Never> with ResponseInvalidMappable {
  const ResponseInvalid([ this.rawResponse, ]) : super(isError: true);

  @MappableField(key: 'raw_response')
  final Object? rawResponse;
}

class _ResponseInvalidHook extends MappingHook {
  const _ResponseInvalidHook();

  @override
  Object? beforeDecode(Object? value) => {
    'raw_response': value,
    'error': true,
  };
}
