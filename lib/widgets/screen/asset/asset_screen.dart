import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';

import '/data_layer_library.dart';
import '/logging.dart';
import '/widgets/component/asset/force_loaded_network_image.dart';


@RoutePage()
class AssetScreen extends StatefulWidget {
  const AssetScreen({
    @pathParam required this.assetId,
    super.key,
  });

  final int assetId;

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  final _controller = PhotoViewController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            final current = _controller.scale ?? 0;
            _controller.scale = current - event.scrollDelta.dy / (500 / current);
          }
        },
        child: PhotoView(
          controller: _controller,
          filterQuality: FilterQuality.high,
          heroAttributes: PhotoViewHeroAttributes(
            tag: 'AssetHero#${widget.assetId}',
          ),
          imageProvider: ForceLoadedNetworkImage.kDebugUseLocalImage
            ? const AssetImage('images/troll_face.png') as ImageProvider<AssetBundleImageKey>
            : NetworkImage(
              api.getAssetUri(widget.assetId).toString(),
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
