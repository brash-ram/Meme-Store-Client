// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gallery.dart';

class GalleryMapper extends ClassMapperBase<Gallery> {
  GalleryMapper._();

  static GalleryMapper? _instance;
  static GalleryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GalleryMapper._());
      ModelObjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Gallery';

  static int _$id(Gallery v) => v.id;
  static const Field<Gallery, int> _f$id = Field('id', _$id);
  static int _$ownerId(Gallery v) => v.ownerId;
  static const Field<Gallery, int> _f$ownerId =
      Field('ownerId', _$ownerId, key: 'owner_id');
  static List<int> _$contributorIds(Gallery v) => v.contributorIds;
  static const Field<Gallery, List<int>> _f$contributorIds =
      Field('contributorIds', _$contributorIds, key: 'contributor_ids');
  static String _$name(Gallery v) => v.name;
  static const Field<Gallery, String> _f$name = Field('name', _$name);
  static String? _$description(Gallery v) => v.description;
  static const Field<Gallery, String> _f$description =
      Field('description', _$description);
  static bool _$public(Gallery v) => v.public;
  static const Field<Gallery, bool> _f$public = Field('public', _$public);
  static bool _$ownedByExtremist(Gallery v) => v.ownedByExtremist;
  static const Field<Gallery, bool> _f$ownedByExtremist =
      Field('ownedByExtremist', _$ownedByExtremist, key: 'owned_by_extremist');
  static bool _$currentTenantCanEdit(Gallery v) => v.currentTenantCanEdit;
  static const Field<Gallery, bool> _f$currentTenantCanEdit = Field(
      'currentTenantCanEdit', _$currentTenantCanEdit,
      key: 'current_tenant_can_edit');

  @override
  final MappableFields<Gallery> fields = const {
    #id: _f$id,
    #ownerId: _f$ownerId,
    #contributorIds: _f$contributorIds,
    #name: _f$name,
    #description: _f$description,
    #public: _f$public,
    #ownedByExtremist: _f$ownedByExtremist,
    #currentTenantCanEdit: _f$currentTenantCanEdit,
  };

  static Gallery _instantiate(DecodingData data) {
    return Gallery(
        id: data.dec(_f$id),
        ownerId: data.dec(_f$ownerId),
        contributorIds: data.dec(_f$contributorIds),
        name: data.dec(_f$name),
        description: data.dec(_f$description),
        public: data.dec(_f$public),
        ownedByExtremist: data.dec(_f$ownedByExtremist),
        currentTenantCanEdit: data.dec(_f$currentTenantCanEdit));
  }

  @override
  final Function instantiate = _instantiate;

  static Gallery fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Gallery>(map);
  }

  static Gallery fromJson(String json) {
    return ensureInitialized().decodeJson<Gallery>(json);
  }
}

mixin GalleryMappable {
  String toJson() {
    return GalleryMapper.ensureInitialized()
        .encodeJson<Gallery>(this as Gallery);
  }

  Map<String, dynamic> toMap() {
    return GalleryMapper.ensureInitialized()
        .encodeMap<Gallery>(this as Gallery);
  }

  @override
  String toString() {
    return GalleryMapper.ensureInitialized().stringifyValue(this as Gallery);
  }
}
