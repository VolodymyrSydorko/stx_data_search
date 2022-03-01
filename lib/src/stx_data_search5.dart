part of stx_data_search;

class DataSearch5<T1, T2, T3, T4, T5> {
  DataSearch5({
    required this.data,
    required this.childrenPath1,
    required this.childrenPath2,
    required this.childrenPath3,
    required this.childrenPath4,
    required this.searchMethod,
  });

  final Iterable<T1> data;
  final ChildrenPath<T1, T2> childrenPath1;
  final ChildrenPath<T2, T3> childrenPath2;
  final ChildrenPath<T3, T4> childrenPath3;
  final ChildrenPath<T4, T5> childrenPath4;
  bool Function(T5 dataItem) searchMethod;

  Iterable<T1> search({bool Function(T5 dataItem)? newSearchMethod}) {
    searchMethod = newSearchMethod ?? searchMethod;

    final dataSearch = DataSearch<T1, T5>(
      data: data,
      depth: 2,
      childrenPaths: [
        childrenPath1.toDynamic(),
        childrenPath2.toDynamic(),
        childrenPath3.toDynamic(),
        childrenPath4.toDynamic(),
      ],
      searchMethod: searchMethod,
    );

    return dataSearch.search();
  }
}
