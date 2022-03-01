import 'package:stx_data_search/stx_data_search.dart';

import 'data.dart';

void main() {
  var dataSearch = DataSearch3<University, Department, Professor>(
    data: universities,
    childrenPath1: ChildrenPath(
      (parent) => parent.departments,
      (parent, children) => parent.copyWith(departments: children.toList()),
    ),
    childrenPath2: ChildrenPath(
      (parent) => parent.processors,
      (parent, children) => parent.copyWith(processors: children.toSet()),
    ),
    searchMethod: (professor) => professor.firstName.startsWith('A'),
  );

  final filteredUniversities = dataSearch.search();

  print('Universities where you can study mathematics: \n');
  for (final university in filteredUniversities) {
    print(university.name);
  }
}
