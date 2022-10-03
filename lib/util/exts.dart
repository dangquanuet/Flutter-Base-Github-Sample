extension ListExt<T> on List<T> {
  T? getOrNull({
    required int index,
  }) =>
      index < 0 || index >= length ? null : this[index];
}
