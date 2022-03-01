import 'package:stx_data_search/stx_data_search.dart';

import 'data.dart';

void main() {
  var dataSearch = DataSearch1<University>(
    data: universities,
    searchMethod: (uni) => uni.name.contains('Lviv'),
  );

  final filteredUniversities = dataSearch.search();

  print('Lviv universities: \n');
  for (final university in filteredUniversities) {
    print(university.name);
  }
}
