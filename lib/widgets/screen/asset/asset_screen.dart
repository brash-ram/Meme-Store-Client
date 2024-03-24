import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '/data_layer_library.dart';
import '/logging.dart';
import '/widgets/component/asset/force_loaded_network_image.dart';


@RoutePage()
class AssetScreen extends StatelessWidget {
  AssetScreen({
    @pathParam required this.assetId,
    super.key,
  });

  final int assetId;
  final controller =  PhotoViewController();

  @override
  Widget build(BuildContext context) {
    final api = context.read<ApiRepository>();
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: const Text('Asset viewer'),
      ),
      body: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            final current = controller.scale ?? 0;
            controller.scale = current - event.scrollDelta.dy / (500 / current);
          }
        },
        child: PhotoView(
          controller: controller,
          heroAttributes: PhotoViewHeroAttributes(
            tag: 'AssetHero#$assetId',
          ),
          imageProvider: ForceLoadedNetworkImage.kDebugUseLocalImage
            ? const AssetImage('images/troll_face.png') as ImageProvider<AssetBundleImageKey>
            : NetworkImage(
              api.getAssetUri(assetId).toString(),
              headers: api.client.authController.authHeaders,
            ) as ImageProvider<NetworkImage>,
          errorBuilder: (context, error, stackTrace) {
            talker.warning('Failed to load image in asset view', error, stackTrace);
            return const Text('Failed to load image.');
          },
        ),
      ),
    );
  }
}
