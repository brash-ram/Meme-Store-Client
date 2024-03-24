import 'package:flutter/material.dart';

import '/data_layer_library.dart';


class MemeDescription extends StatelessWidget {
  const MemeDescription({ super.key, });

  @override
  Widget build(BuildContext context) =>
    ModelBlocDataSelector<MemeBloc, Meme, String>(
      selector: (value) => value.description,
      builder: (context, data) => Text(data),
    );
}
