import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'bloc_event.dart';
import 'bloc_state.dart';


abstract class ModelBloc<T> extends Bloc<BlocEvent<T>, BlocState<T>> {
  ModelBloc() : super(BlocStateInitial<T>()) {
    _subscription = _getSubscription();

    on<BlocDataEvent<T>>(_emitData);
    on<BlocErrorEvent<T>>(_emitError);
    on<BlocUpdateEvent<T>>(_emitUpdate);
  }

  Stream<T> get dataStream;
  Future<void> refreshData();

  T? _latestValue;
  late StreamSubscription<T> _subscription;

  void _streamListener(T event) {
    add(BlocDataEvent(event));
  }

  void _emitUpdate(BlocUpdateEvent<T> event, Emitter<BlocState<T>> emit) {
    final previousValue = event.previousValue;
    if (previousValue == null)
      emit(
        BlocStateInitial<T>(),
      );
    else
      emit(
        BlocStateUpdating(value: previousValue),
      );
  }

  void _emitData(BlocDataEvent<T> event, Emitter<BlocState<T>> emit) {
    if (event.value != _latestValue) {
      _latestValue = event.value;
      emit(
        BlocStateData(value: event.value),
      );
    }
  }

  void _emitError(BlocErrorEvent<T> event, Emitter<BlocState<T>> emit) => emit(
    switch (_latestValue) {
      null => BlocStateError(
        error: event.error,
        stackTrace: event.stackTrace,
      ),
      final latestValue =>
        BlocStateErrorWithValue(
          error: event.error,
          stackTrace: event.stackTrace,
          value: latestValue,
        ),
    }, 
  );

  void _addError(Object error, StackTrace? stackTrace) =>
    add(BlocErrorEvent<T>(error, stackTrace));

  StreamSubscription<T> _getSubscription() => dataStream
    .listen(_streamListener)
    ..onError(_addError);

  /// Fetch data without discarding previous state.
  Future<void> update() async {
    add(BlocUpdateEvent(_latestValue));
    return refreshData();
  }

  /// Reset state to initial and fetch data.
  Future<void> invalidate() async {
    _latestValue = null;
    add(BlocUpdateEvent<T>(null));
    return refreshData();
  }

  @visibleForTesting
  void debugAddError([ Object? error, StackTrace? stackTrace, ]) {
    error ??= Exception('Debug exception');
    _addError(error, stackTrace);
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
