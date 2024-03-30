import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '/logging.dart';


class ForceLoadedNetworkImage extends StatefulWidget {
  const ForceLoadedNetworkImage({
    required this.uri,
    this.headers = const {},
    super.key,
  });

  static const kDebugUseLocalImage = false; 
  static const backgroundBlurRadius = 10.0; 

  final Uri uri;
  final Map<String, String> headers;

  @override
  State<ForceLoadedNetworkImage> createState() => _ForceLoadedNetworkImageState();
}

class _ForceLoadedNetworkImageState extends State<ForceLoadedNetworkImage> {
  static final _random = Random();

  late Uri uri;

  @override
  void initState() {
    uri = widget.uri;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ForceLoadedNetworkImage oldWidget) {
    updateUri();
    super.didUpdateWidget(oldWidget);
  }

  void updateUri() {
    uri = widget.uri.replace(
      queryParameters: {
        ...widget.uri.queryParameters,
        'nonce': _random.nextDouble().toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = ForceLoadedNetworkImage.kDebugUseLocalImage
      ? const AssetImage('images/troll_face.png') as ImageProvider<AssetBundleImageKey>
      : NetworkImage(
        uri.toString(),
        headers: widget.headers,
      ) as ImageProvider<NetworkImage>;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400),
      child: Stack(
        children: [
          Positioned(
            left: -ForceLoadedNetworkImage.backgroundBlurRadius * 2,
            right: -ForceLoadedNetworkImage.backgroundBlurRadius * 2,
            top: -ForceLoadedNetworkImage.backgroundBlurRadius * 2,
            bottom: -ForceLoadedNetworkImage.backgroundBlurRadius * 2,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: ForceLoadedNetworkImage.backgroundBlurRadius,
                sigmaY: ForceLoadedNetworkImage.backgroundBlurRadius,
              ),
              child: Image(
                image: image,
                filterQuality: FilterQuality.none,
                fit: BoxFit.cover,
                excludeFromSemantics: true,
                errorBuilder: (context, error, stackTrace) => const SizedBox.expand(),
              ),
            ),
          ),
          Positioned.fill(
            child: Image(
              image: image,
              filterQuality: FilterQuality.medium,
              isAntiAlias: true,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                talker.verbose('Failed to load image', error, stackTrace);
                return Center(
                  child: ElevatedButton.icon(
                    label: const Text('Failed to load'),
                    icon: const Icon(Icons.refresh),
                    onPressed: () => setState(updateUri),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
