import 'package:dart_mappable/dart_mappable.dart';

part 'response_ok.dart';
part 'response_invalid.dart';
part 'response_error.dart';
part 'response.mapper.dart';


@MappableClass()
sealed class Response<T> with ResponseMappable<T> {
  const Response({
    required this.isError,
  });

  @MappableField(key: 'error')
  final bool isError;
}
