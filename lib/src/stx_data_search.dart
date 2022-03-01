part of stx_data_search;

class ChildrenPath<T1, T2> {
  ChildrenPath(
    this.getChildren,
    this.setChildren, {
    this.searchMethod,
    this.keepIfEmpty = false,
  });

  final Iterable<T2> Function(T1 parent) getChildren;
  bool Function(T2 dataItem)? searchMethod;
  final T1 Function(T1 parent, Iterable<T2> children) setChildren;
  final bool keepIfEmpty;

  ChildrenPath toDynamic() {
    return ChildrenPath(
      (parent) => getChildren(parent),
      (parent, children) => setChildren(parent, children.cast<T2>()),
      searchMethod: searchMethod == null ? null : (item) => searchMethod!(item),
      keepIfEmpty: keepIfEmpty,
    );
  }
}

class DataSearch<T1> {
  DataSearch({
    required this.data,
    this.searchMethod,
    this.depth = 0,
    this.childrenPaths = const [],
  }) : assert(depth <= childrenPaths.length);

  final Iterable<T1> data;
  final int depth;
  final List<ChildrenPath> childrenPaths;
  bool Function(T1 dataItem)? searchMethod;

  Iterable<T1> search() {
    final filteredData =
        searchMethod == null ? data : data.where(searchMethod!);

    return depth == 0 ? filteredData : _search(0, filteredData).cast<T1>();
  }

  Iterable _search(int depth, Iterable data) {
    if (this.depth == depth) {
      return filter(data, childrenPaths[depth - 1].searchMethod);
    } else {
      final copyData = [];

      for (var parent in data) {
        final childrenPath = childrenPaths[depth];

        var children = childrenPath.getChildren(parent);

        children = filter(children, childrenPath.searchMethod);

        final filteredChildren = _search(depth + 1, children);

        if (filteredChildren.isNotEmpty || childrenPath.keepIfEmpty) {
          final copyParent = childrenPath.setChildren(parent, filteredChildren);

          copyData.add(copyParent);
        }
      }

      return copyData;
    }
  }

  Iterable filter(Iterable data, bool Function(dynamic)? searchMethod) {
    return searchMethod == null ? data : data.where(searchMethod);
  }
}
