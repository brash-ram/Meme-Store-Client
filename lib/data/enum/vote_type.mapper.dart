// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'vote_type.dart';

class VoteTypeMapper extends EnumMapper<VoteType> {
  VoteTypeMapper._();

  static VoteTypeMapper? _instance;
  static VoteTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VoteTypeMapper._());
    }
    return _instance!;
  }

  static VoteType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  VoteType decode(dynamic value) {
    switch (value) {
      case 'down':
        return VoteType.down;
      case 'up':
        return VoteType.up;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(VoteType self) {
    switch (self) {
      case VoteType.down:
        return 'down';
      case VoteType.up:
        return 'up';
    }
  }
}

extension VoteTypeMapperExtension on VoteType {
  String toValue() {
    VoteTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<VoteType>(this) as String;
  }
}
