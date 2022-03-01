import 'package:stx_data_search/stx_data_search.dart';

import 'data.dart';

void main() {
  var dataSearch = DataSearch2<University, Department>(
    data: universities,
    childrenPath: ChildrenPath(
      (parent) => parent.departments,
      (parent, children) => parent.copyWith(departments: children.toList()),
    ),
    searchMethod: (department) => department.name.contains('Mathematics'),
  );

  final filteredUniversities = dataSearch.search();

  print('Faculties in an university where you can study mathematics: \n');
  for (final university in filteredUniversities) {
    print(university.name + ':');
    for (final faculty in university.departments) {
      print(faculty.name);
    }
    print('\n');
  }
}
