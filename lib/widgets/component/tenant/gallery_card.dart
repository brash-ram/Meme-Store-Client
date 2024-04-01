import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mem_store_client/data_layer_library.dart';

import '../../../core/router/router.dart';
import '../asset/force_loaded_network_image.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ModelBlocDataSelector<GalleryBloc, Gallery, int?>(
              selector: (value) => value.previewId,
              builder: (context, data) {
                final api = context.read<ApiRepository>();
                return data == null
                    ? SizedBox(
                        height: 200,
                        child: material.Image.asset('assets/images/gallery.png'),
                      )
                    : SizedBox(
                        height: 200,
                        child: ForceLoadedNetworkImage(
                          uri: api.getAssetUri(data),
                          headers: api.client.authController.authHeaders,
                        ),
                    );
              },
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: switch(Theme.of(context).cardTheme.shape) {
            RoundedRectangleBorder(:final borderRadius) => borderRadius.resolve(null),
              _ => const BorderRadius.all(Radius.circular(12.0)),
            },
            onTap: () async {
              final galleryBloc = context.read<GalleryBloc>();
              await context.navigateTo(GalleryRoute(galleryId: galleryBloc.id));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row( // Row is needed to expand in cross axis
                    children: [
                      // image placeholder, to preserve image space as we draw over it
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: Center(
                      child: ModelBlocDataSelector<GalleryBloc, Gallery, String>(
                        selector: (value) => value.name,
                        builder: (context, data) => Text(
                          data,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      ],
    ),
  );
}
