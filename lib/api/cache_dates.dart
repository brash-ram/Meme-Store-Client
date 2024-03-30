extension type CacheDates<T extends Object>._(Expando<DateTime> _cacheDate) {
  factory CacheDates() => CacheDates._(Expando());

  static final _zeroTime = DateTime.fromMillisecondsSinceEpoch(0);

  DateTime get(T object) => _cacheDate[object] ?? _zeroTime;
  void update(T object) => _cacheDate[object] = DateTime.now();
  void reset(T object) => _cacheDate[object] = null;
}
