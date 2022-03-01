part of stx_data_search;

class DataSearch3<T1, T2, T3> {
  DataSearch3({
    required this.data,
    required this.childrenPath1,
    required this.childrenPath2,
    required this.searchMethod,
  });

  final Iterable<T1> data;
  final ChildrenPath<T1, T2> childrenPath1;
  final ChildrenPath<T2, T3> childrenPath2;
  bool Function(T3 dataItem) searchMethod;

  Iterable<T1> search({bool Function(T3 dataItem)? newSearchMethod}) {
    searchMethod = newSearchMethod ?? searchMethod;

    final dataSearch = DataSearch<T1, T3>(
      data: data,
      depth: 2,
      childrenPaths: [
        childrenPath1.toDynamic(),
        childrenPath2.toDynamic(),
      ],
      searchMethod: searchMethod,
    );

    return dataSearch.search();
  }
}
