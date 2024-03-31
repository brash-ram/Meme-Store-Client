import 'package:flutter/material.dart';
import 'package:mem_store_client/data_layer_library.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: ModelBlocDataSelector<GalleryBloc, Gallery, String>(
        selector: (value) => value.name,
        builder: (context, data) => Text(
          data,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
}
