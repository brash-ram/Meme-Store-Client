import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/tenant/tenant_profile_widget.dart';
import '/data_layer_library.dart';


@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({ super.key, });

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: TenantProfileBloc(context.read(), null),
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ModelBlocDataSelector<TenantProfileBloc, TenantProfile, String>(
          selector: (value) => value.displayName,
          builder: (context, state) => Text(state),
        ),
        actions: [
          if (kDebugMode)
            Builder(
              builder: (context) =>
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                  onPressed: () async => context.read<TenantProfileBloc>().update(),
                ),
            ),
          if (kDebugMode)
            Builder(
              builder: (context) =>
                IconButton(
                  icon: const Icon(Icons.rotate_right),
                  tooltip: 'Reset',
                  onPressed: () async => context.read<TenantProfileBloc>().reset(),
                ),
            ),
        ],
      ),
      body: const TenantProfileWidget(),
    ),
  );
}
