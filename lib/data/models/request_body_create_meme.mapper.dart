// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_body_create_meme.dart';

class RequestBodyCreateMemeMapper
    extends ClassMapperBase<RequestBodyCreateMeme> {
  RequestBodyCreateMemeMapper._();

  static RequestBodyCreateMemeMapper? _instance;
  static RequestBodyCreateMemeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestBodyCreateMemeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RequestBodyCreateMeme';

  static String _$title(RequestBodyCreateMeme v) => v.title;
  static const Field<RequestBodyCreateMeme, String> _f$title =
      Field('title', _$title);
  static String _$description(RequestBodyCreateMeme v) => v.description;
  static const Field<RequestBodyCreateMeme, String> _f$description =
      Field('description', _$description);
  static List<String> _$tags(RequestBodyCreateMeme v) => v.tags;
  static const Field<RequestBodyCreateMeme, List<String>> _f$tags =
      Field('tags', _$tags);

  @override
  final MappableFields<RequestBodyCreateMeme> fields = const {
    #title: _f$title,
    #description: _f$description,
    #tags: _f$tags,
  };

  static RequestBodyCreateMeme _instantiate(DecodingData data) {
    return RequestBodyCreateMeme(
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestBodyCreateMeme fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestBodyCreateMeme>(map);
  }

  static RequestBodyCreateMeme fromJson(String json) {
    return ensureInitialized().decodeJson<RequestBodyCreateMeme>(json);
  }
}

mixin RequestBodyCreateMemeMappable {
  String toJson() {
    return RequestBodyCreateMemeMapper.ensureInitialized()
        .encodeJson<RequestBodyCreateMeme>(this as RequestBodyCreateMeme);
  }

  Map<String, dynamic> toMap() {
    return RequestBodyCreateMemeMapper.ensureInitialized()
        .encodeMap<RequestBodyCreateMeme>(this as RequestBodyCreateMeme);
  }

  @override
  String toString() {
    return RequestBodyCreateMemeMapper.ensureInitialized()
        .stringifyValue(this as RequestBodyCreateMeme);
  }
}
