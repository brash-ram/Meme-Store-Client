sealed class BlocEvent<T> {}

final class BlocDataEvent<T> implements BlocEvent<T> {
  const BlocDataEvent(this.value);

  final T value;
}

final class BlocUpdateEvent<T> implements BlocEvent<T> {
  const BlocUpdateEvent(this.previousValue);

  final T? previousValue;
}

final class BlocErrorEvent<T> implements BlocEvent<T> {
  const BlocErrorEvent(this.error, [this.stackTrace]);

  final Object error;
  final StackTrace? stackTrace;
}
