// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'asset_temporary_ticket.dart';

class AssetTemporaryTicketMapper extends ClassMapperBase<AssetTemporaryTicket> {
  AssetTemporaryTicketMapper._();

  static AssetTemporaryTicketMapper? _instance;
  static AssetTemporaryTicketMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssetTemporaryTicketMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AssetTemporaryTicket';

  static String _$temporaryTicket(AssetTemporaryTicket v) => v.temporaryTicket;
  static const Field<AssetTemporaryTicket, String> _f$temporaryTicket =
      Field('temporaryTicket', _$temporaryTicket);

  @override
  final MappableFields<AssetTemporaryTicket> fields = const {
    #temporaryTicket: _f$temporaryTicket,
  };

  static AssetTemporaryTicket _instantiate(DecodingData data) {
    return AssetTemporaryTicket(temporaryTicket: data.dec(_f$temporaryTicket));
  }

  @override
  final Function instantiate = _instantiate;

  static AssetTemporaryTicket fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AssetTemporaryTicket>(map);
  }

  static AssetTemporaryTicket fromJson(String json) {
    return ensureInitialized().decodeJson<AssetTemporaryTicket>(json);
  }
}

mixin AssetTemporaryTicketMappable {
  String toJson() {
    return AssetTemporaryTicketMapper.ensureInitialized()
        .encodeJson<AssetTemporaryTicket>(this as AssetTemporaryTicket);
  }

  Map<String, dynamic> toMap() {
    return AssetTemporaryTicketMapper.ensureInitialized()
        .encodeMap<AssetTemporaryTicket>(this as AssetTemporaryTicket);
  }

  @override
  String toString() {
    return AssetTemporaryTicketMapper.ensureInitialized()
        .stringifyValue(this as AssetTemporaryTicket);
  }
}
