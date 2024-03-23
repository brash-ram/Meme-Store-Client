import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc.dart';


class ModelBlocSelector<B extends ModelBloc<S>, S, T> extends StatelessWidget {
  const ModelBlocSelector({
    required this.selector,
    required this.builder,
    this.bloc,
    super.key,
  });

  final T Function(S value) selector;
  final Widget Function(BuildContext context, BlocState<T> state) builder;
  final B? bloc;

  BlocState<T> _selector(BlocState<S> state) =>
    state.select(selector);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty.has('selector', selector))
      ..add(ObjectFlagProperty.has('builder', builder))
      ..add(DiagnosticsProperty('bloc', bloc));
  }

  @override
  Widget build(BuildContext context) =>
    BlocSelector(
      selector: _selector,
      builder: builder,
      bloc: bloc,
    );
}
