part of stx_data_search;

class ChildrenPath<T1, T2> {
  ChildrenPath(
    this.getChildren,
    this.setChildren, {
    this.keepIfEmpty = false,
  });

  final Iterable<T2> Function(T1 parent) getChildren;
  final T1 Function(T1 parent, Iterable<T2> children) setChildren;
  final bool keepIfEmpty;

  ChildrenPath toDynamic() {
    return ChildrenPath(
      (parent) => getChildren(parent),
      (parent, children) => setChildren(parent, children.cast<T2>()),
      keepIfEmpty: keepIfEmpty,
    );
  }
}

class DataSearch<T1, TL> {
  DataSearch({
    required this.data,
    required this.searchMethod,
    this.depth = 0,
    this.childrenPaths = const [],
  }) : assert(depth <= childrenPaths.length);

  final Iterable<T1> data;
  final int depth;
  final List<ChildrenPath> childrenPaths;
  bool Function(TL dataItem) searchMethod;

  Iterable<T1> search({bool Function(TL dataItem)? newSearchMethod}) {
    searchMethod = newSearchMethod ?? searchMethod;

    return _search(0, data).cast<T1>();
  }

  Iterable _search(int depth, Iterable data) {
    if (this.depth > depth) {
      final copyData = [];

      for (var parent in data) {
        final childrenPath = childrenPaths[depth];

        final children = childrenPath.getChildren(parent);

        final filteredChildren = _search(depth + 1, children);

        if (filteredChildren.isNotEmpty || childrenPath.keepIfEmpty) {
          final copyParent = childrenPath.setChildren(parent, filteredChildren);

          copyData.add(copyParent);
        }
      }

      return copyData;
    } else {
      return data.where((element) => searchMethod(element));
    }
  }
}
