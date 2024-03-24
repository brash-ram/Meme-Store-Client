import 'package:flutter/material.dart';

import '/data_layer_library.dart';
import '/widgets/component/tenant/tenant_link.dart';


class MemeAuthor extends StatelessWidget {
  const MemeAuthor({ super.key, });

  @override
  Widget build(BuildContext context) =>
    ModelBlocDataSelector<MemeBloc, Meme, int>(
      selector: (value) => value.authorId,
      builder: (context, data) => TenantLink(id: data),
    );
}
