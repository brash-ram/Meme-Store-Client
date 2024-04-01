import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/tenant/tenant_profile_widget.dart';
import '/data_layer_library.dart';

@RoutePage()
class TenantProfileScreen extends StatelessWidget {
  const TenantProfileScreen({
    @pathParam required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: TenantProfileBloc(context.read(), id),
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
