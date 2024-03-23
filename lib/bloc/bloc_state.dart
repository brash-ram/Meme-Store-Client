import 'package:equatable/equatable.dart';


sealed class BlocState<T> with EquatableMixin {
  T? get value;

  BlocState<S> select<S>(S Function(T value) selector);
}

sealed class BlocStateLoading<T> implements BlocState<T> { }
sealed class BlocStateWithValue<T> implements BlocState<T> {
  @override
  T get value;
}

final class BlocStateError<T> with EquatableMixin implements BlocState<T> {
  const factory BlocStateError({
    required Object error,
    StackTrace? stackTrace,
  }) = BlocStateError<Never>._;

  const BlocStateError._({
    required this.error,
    this.stackTrace,
  });

  final Object error;
  final StackTrace? stackTrace;

  @override
  T? get value => null;

  @override
  BlocStateError<S> select<S>(S Function(T value) selector) =>
    this as BlocStateError<Never>;

  @override
  String toString() => 'BlocStateError<Never>(value: $value, error: $error)';

  @override
  List<Object?> get props => [ error, stackTrace, ];
}

final class BlocStateErrorWithValue<T> with EquatableMixin implements BlocStateError<T>, BlocStateWithValue<T> {
  const BlocStateErrorWithValue({
    required this.value,
    required this.error,
    this.stackTrace,
  });

  @override
  final T value;
  @override
  final Object error;
  @override
  final StackTrace? stackTrace;

  @override
  BlocStateErrorWithValue<S> select<S>(S Function(T value) selector) =>
    BlocStateErrorWithValue(
      error: error,
      stackTrace: stackTrace,
      value: selector(value),
    );

  @override
  String toString() => 'BlocStateError<$T>(value: $value, error: $error)';

  @override
  List<Object?> get props => [ value, error, stackTrace, ];
}

final class BlocStateInitial<T> with EquatableMixin implements BlocStateLoading<T> {
  const factory BlocStateInitial() = BlocStateInitial<Never>._;

  const BlocStateInitial._();

  @override
  T? get value => null;

  @override
  BlocStateInitial<S> select<S>(S Function(T value) selector) =>
    const BlocStateInitial();

  @override
  String toString() => 'BlocStateInitial<$T>()';

  @override
  List<Object?> get props => [ value, ];
}

final class BlocStateUpdating<T> with EquatableMixin implements BlocStateLoading<T>, BlocStateWithValue<T> {
  const BlocStateUpdating({required this.value});

  @override
  final T value;

  @override
  BlocStateUpdating<S> select<S>(S Function(T value) selector) =>
    BlocStateUpdating(value: selector(value));

  @override
  String toString() => 'BlocStateUpdating<$T>(value: $value)';

  @override
  List<Object?> get props => [ value, ];
}

final class BlocStateData<T> with EquatableMixin implements BlocStateWithValue<T> {
  const BlocStateData({required this.value});

  @override
  final T value;

  @override
  BlocStateData<S> select<S>(S Function(T value) selector) =>
    BlocStateData(value: selector(value));

  @override
  String toString() => 'BlocStateData<$T>(value: $value)';

  @override
  List<Object?> get props => [ value, ];
}
