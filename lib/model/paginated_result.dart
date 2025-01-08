class PaginatedData<T> {
  final List<T> items;
  final bool reachedEnd;

  PaginatedData({
    required this.items,
    required this.reachedEnd,
  });
}
