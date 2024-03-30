import 'package:dart_mappable/dart_mappable.dart';

part 'asset_temporary_ticket.mapper.dart';


@MappableClass()
class AssetTemporaryTicket with AssetTemporaryTicketMappable {
  const AssetTemporaryTicket({
    required this.temporaryTicket,
  });

  @MappableField(key: 'temporaryTicket')
  final String temporaryTicket;
}
