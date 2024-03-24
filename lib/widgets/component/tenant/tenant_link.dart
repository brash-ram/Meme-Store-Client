import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '/core/router/router.dart';
import '/data_layer_library.dart';

class TenantLink extends StatelessWidget {
  const TenantLink({
    required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context) =>
    BlocProvider(
      key: Key('TenantLink#$id'),
      create: (context) => TenantBloc(context.read(), id),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        onTap: () async => context.navigateTo(TenantProfileRoute(id: id)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
            ModelBlocDataSelector<TenantBloc, Tenant, String>(
              selector: (value) => value.displayName,
              builder: (context, data) => Text(data),              
            ),
          ],
        ),
      ),
    );
}
