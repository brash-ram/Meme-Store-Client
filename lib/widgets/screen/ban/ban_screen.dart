import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data_layer_library.dart';

@RoutePage()
class BanScreen extends StatelessWidget {
  const BanScreen({ super.key, });

  static const _anonymous = AssetImage('images/anonymous.jpg');

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: TenantProfileBloc(context.read(), null),
    child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ModelBlocDataSelector<TenantProfileBloc, TenantProfile, String>(
          selector: (value) => value.displayName,
          builder: (context, state) => Text('Banned: $state'),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Banned',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Builder(
            builder: (context) {
              final image = switch (context.read<ApiRepository>().client.authController.token?.$1.photoUrl) {
                final url? => NetworkImage(url.replaceFirst('t.me/i/userpic', 'null.moe/tg_user_pic')) as ImageProvider<Object>,
                null => _anonymous,
              };
              return Center(
                child: Stack(
                  children: [
                    material.Image(
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                      image: image,
                      loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null ? child : const material.Image(
                          width: 250,
                          height: 250,
                          image: _anonymous,
                        ),
                      errorBuilder: (context, error, stackTrace) =>
                        const material.Image(
                          width: 250,
                          height: 250,
                          image: _anonymous,
                        ),
                    ),
                    const Positioned.fill(
                      child: Icon(
                        Icons.block,
                        color: Colors.red,
                        size: 200,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
