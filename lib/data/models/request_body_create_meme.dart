import 'package:dart_mappable/dart_mappable.dart';

part 'request_body_create_meme.mapper.dart';


@MappableClass()
class RequestBodyCreateMeme with RequestBodyCreateMemeMappable {
  const RequestBodyCreateMeme({
    required this.title,
    required this.description,
    required this.tags,
  });

  @MappableField(key: 'title')
  final String title;

  @MappableField(key: 'description')
  final String description;

  @MappableField(key: 'tags')
  final List<String> tags;
}
