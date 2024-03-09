import 'package:dart_mappable/dart_mappable.dart';

import 'model_object.dart';

part 'gallery.mapper.dart';


@MappableClass()
class Gallery extends ModelObject with GalleryMappable {
  const Gallery({
    required super.id,
    required this.ownerId,
    required this.contributorIds,
    required this.name,
    required this.description,
    required this.public,
    required this.ownedByExtremist,
    required this.currentTenantCanEdit,
  });

  @MappableField(key: 'owner_id')
  final int ownerId;

  @MappableField(key: 'contributor_ids')
  final List<int> contributorIds;

  @MappableField(key: 'name')
  final String name;

  @MappableField(key: 'description')
  final String description;

  @MappableField(key: 'public')
  final bool public;

  @MappableField(key: 'owned_by_extremist')
  final bool ownedByExtremist;

  @MappableField(key: 'current_tenant_can_edit')
  final bool currentTenantCanEdit;
}
