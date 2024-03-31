import 'package:flutter/material.dart';

import '../../../data_layer_library.dart';
import 'tenant_profile/tenant_profile_galleries.dart';

class TenantProfileWidget extends StatelessWidget {
  const TenantProfileWidget({super.key});

  @override
  Widget build(BuildContext context) => ModelBlocDataSelector<TenantProfileBloc, TenantProfile, List<int>>(
    selector: (value) => [...value.privateGalleries, ...value.publicGalleries],
    builder: (context, data) => CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
            Center(
              child: ModelBlocDataSelector<TenantProfileBloc, TenantProfile, String>(
                selector: (value) => value.displayName,
                builder: (context, data) => Text(
                  data,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: ModelBlocDataSelector<TenantProfileBloc, TenantProfile, String>(
                selector: (value) => value.uniqueName,
                builder: (context, data) => Text(
                  data,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
        TenantProfileGalleries(galleryIds: data),
      ],
    ),
  );
}
