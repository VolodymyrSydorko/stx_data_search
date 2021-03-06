part of stx_data_search;

class DataSearch1<T1> {
  DataSearch1({
    required this.data,
    required this.searchMethod,
  });

  final Iterable<T1> data;
  bool Function(T1 dataItem) searchMethod;

  Iterable<T1> search() {
    final dataSearch = DataSearch<T1>(
      data: data,
      searchMethod: searchMethod,
    );

    return dataSearch.search();
  }
}
