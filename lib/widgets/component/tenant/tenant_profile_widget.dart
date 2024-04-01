import 'package:flutter/material.dart';

import '/data_layer_library.dart';
import 'tenant_profile_galleries.dart';


class TenantProfileWidget extends StatelessWidget {
  const TenantProfileWidget({super.key});

  @override
  Widget build(BuildContext context) => ModelBlocDataSelector<TenantProfileBloc, TenantProfile, List<int>>(
    selector: (value) => [...value.privateGalleries, ...value.publicGalleries],
    builder: (context, data) => CustomScrollView(
      slivers: [
        SliverList.list(
          children: [
            const SizedBox(
              height: 80.0,
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ModelBlocDataSelector<TenantProfileBloc, TenantProfile, String>(
                  selector: (value) => value.displayName,
                  builder: (context, data) => Text(
                    data,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: ModelBlocDataSelector<TenantProfileBloc, TenantProfile, String>(
                selector: (value) => value.uniqueName,
                builder: (context, data) => Text(
                  data,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
          ],
        ),
        TenantProfileGalleries(galleryIds: data),
      ],
    ),
  );
}
