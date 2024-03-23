import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc.dart';
import 'error_text.dart';


class ModelBlocDataSelectorState<B extends ModelBloc<S>, S, T> extends State<ModelBlocDataSelector<B, S, T>> {
  static Widget _defaultErrorBuilder<T>(BuildContext context, BlocStateError<T> state)
    => ErrorText(state.error);
  static Widget _defaultLoadingBuilder<T>(BuildContext context, BlocStateLoading<T> state)
    => const Text('Loading...');

  (T, Widget)? _lastBuild;

  @override
  void didUpdateWidget(covariant ModelBlocDataSelector<B, S, T> oldWidget) {
    _lastBuild = null;
    super.didUpdateWidget(oldWidget);
  }

  BlocState<T> _selector(BlocState<S> state) => 
    state.select(widget.selector);

  Widget _build(BuildContext context, T data) {
    if (_lastBuild case (final cachedData, final cachedWidget)? when cachedData == data) {
      // skip build
      return cachedWidget;
    }
    final builtWidget = widget.builder(context, data);
    _lastBuild = (data, builtWidget);
    return builtWidget;
  }
  Widget _buildError(BuildContext context, BlocStateError<T> state) {
    _lastBuild = null;
    return (widget.errorBuilder ?? _defaultErrorBuilder).call(context, state);
  }
  Widget _buildLoading(BuildContext context, BlocStateLoading<T> state) {
    _lastBuild = null;
    return (widget.loadingBuilder ?? _defaultLoadingBuilder).call(context, state);
  }

  Widget _builder(BuildContext context, BlocState<T> state) => switch (state) {
    BlocStateErrorWithValue(:final value) when widget.showOldDataOnError => _build(context, value),
    BlocStateUpdating(:final value) when widget.showOldDataOnLoad => _build(context, value),
    final BlocStateError<T> state => _buildError(context, state),
    final BlocStateLoading<T> state => _buildLoading(context, state),
    BlocStateData(:final value) => _build(context, value),
  };

  @override
  Widget build(BuildContext context) =>
    BlocSelector(
      selector: _selector,
      builder: _builder,
      bloc: widget.bloc,
    );
}

class ModelBlocDataSelector<B extends ModelBloc<S>, S, T> extends StatefulWidget {
  const ModelBlocDataSelector({
    required this.selector,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
    this.showOldDataOnLoad = true,
    this.showOldDataOnError = false,
    this.bloc,
    super.key,
  });

  final bool showOldDataOnLoad;
  final bool showOldDataOnError;
  final T Function(S value) selector;
  final Widget Function(BuildContext context, T data) builder;
  final Widget Function(BuildContext context, BlocStateError<T> data)? errorBuilder;
  final Widget Function(BuildContext context, BlocStateLoading<T> data)? loadingBuilder;
  final B? bloc;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty.has('selector', selector))
      ..add(ObjectFlagProperty.has('builder', builder))
      ..add(ObjectFlagProperty.has('errorBuilder', errorBuilder))
      ..add(ObjectFlagProperty.has('loadingBuilder', loadingBuilder))
      ..add(DiagnosticsProperty('bloc', bloc))
      ..add(DiagnosticsProperty('showOldDataOnLoad', showOldDataOnLoad))
      ..add(DiagnosticsProperty('showOldDataOnError', showOldDataOnError));
  }

  @override
  State<ModelBlocDataSelector<B, S, T>> createState() => ModelBlocDataSelectorState<B, S, T>();
}
