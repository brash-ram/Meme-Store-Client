import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data_layer_library.dart';


@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({ super.key, });

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: TenantProfileBloc(context.read(), 1),
    child: Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
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
                    onPressed: () async => context.read<TenantBloc>().update(),
                  ),
            ),
          if (kDebugMode)
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: const Icon(Icons.rotate_right),
                    tooltip: 'Reset',
                    onPressed: () async => context.read<TenantBloc>().reset(),
                  ),
            ),
        ],
      ),
      body: Text('Profile 1'),
    ),
  );
}
