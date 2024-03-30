extension type RefsCounter<T extends Object>._(Expando<int> _refsCount) {
  factory RefsCounter() => RefsCounter._(Expando());

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int _changeRefsCount(T object, int diff) =>
    _refsCount[object] = getCurrent(object) + diff;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int getCurrent(T object) => _refsCount[object] ?? 0;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int operator+(T object) => increase(object);
  
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int operator-(T object) => decrease(object);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int increase(T object) => _changeRefsCount(object, 1);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int decrease(T object) => _changeRefsCount(object, -1);
}
