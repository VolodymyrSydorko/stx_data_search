part of stx_data_search;

class DataSearch2<T1, T2> {
  DataSearch2({
    required this.data,
    required this.childrenPath,
    required this.searchMethod,
  });

  final Iterable<T1> data;
  final ChildrenPath<T1, T2> childrenPath;
  bool Function(T2 dataItem) searchMethod;

  Iterable<T1> search({bool Function(T2 dataItem)? newSearchMethod}) {
    searchMethod = newSearchMethod ?? searchMethod;

    final dataSearch = DataSearch<T1, T2>(
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
