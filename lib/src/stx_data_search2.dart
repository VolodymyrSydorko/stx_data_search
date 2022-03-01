part of stx_data_search;

class DataSearch2<T1, T2> {
  DataSearch2({
    required this.data,
    required this.childrenPath,
    searchMethod,
  });

  final Iterable<T1> data;
  final ChildrenPath<T1, T2> childrenPath;
  bool Function(T1 dataItem)? searchMethod;

  Iterable<T1> search() {
    final dataSearch = DataSearch<T1>(
      data: data,
      depth: 1,
      childrenPaths: [
        childrenPath.toDynamic(),
      ],
      searchMethod: searchMethod,
    );

    return dataSearch.search();
  }
}
