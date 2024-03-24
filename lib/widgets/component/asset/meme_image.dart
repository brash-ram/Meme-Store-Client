import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/router/router.dart';
import '/data_layer_library.dart';
import 'force_loaded_network_image.dart';


class MemeImage extends StatelessWidget {
  const MemeImage({
    super.key,
    this.interactive = true,
  });

  final bool interactive;

  @override
  Widget build(BuildContext context) =>
    ModelBlocDataSelector<MemeBloc, Meme, int>(
      selector: (value) => value.assetId,
      builder: (context, data) {
        final api = context.read<ApiRepository>();
        return GestureDetector(
          onTap: () async => interactive
            ? context.navigateTo(AssetRoute(assetId: data))
            : null,
          child: Hero(
            tag: 'AssetHero#$data',
            child: ForceLoadedNetworkImage(
              uri: api.getAssetUri(data),
              headers: api.client.authController.authHeaders,
            ),
          ),
        );
      },
    );
}
