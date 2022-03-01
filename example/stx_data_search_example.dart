import 'package:stx_data_search/stx_data_search.dart';

import 'data.dart';

void main() {
  // example1
  print('example 1');
  var dataSearch1 = DataSearch1<University>(
    data: universities,
    searchMethod: (uni) => uni.name.contains('Lviv'),
  );

  final filteredUniversities1 = dataSearch1.search();

  print('Lviv universities: \n');
  for (final university in filteredUniversities1) {
    print(university.name);
  }

  var dataSearch2 = DataSearch2<University, Department>(
    data: universities,
    childrenPath: ChildrenPath(
      (parent) => parent.departments,
      (parent, children) => parent.copyWith(departments: children.toList()),
      searchMethod: (department) => department.name.contains('Mathematics'),
    ),
  );

  // example2
  print('\nexample 2');
  final filteredUniversities2 = dataSearch2.search();

  print('Faculties where you can study mathematics: \n');
  for (final university in filteredUniversities2) {
    print(university.name + ':');
    for (final faculty in university.departments) {
      print(faculty.name);
    }
    print('\n');
  }

  // example3
  print('example 3');
  var dataSearch3 = DataSearch3<University, Department, Professor>(
      data: universities,
      childrenPath1: ChildrenPath(
        (parent) => parent.departments,
        (parent, children) => parent.copyWith(departments: children.toList()),
      ),
      childrenPath2: ChildrenPath(
        (parent) => parent.professors,
        (parent, children) => parent.copyWith(professors: children.toSet()),
        searchMethod: (professor) =>
            professor.firstName.startsWith(RegExp(r'[A-J]')),
      ),
      searchMethod: (uni) => uni.name.contains('Lviv'));

  final filteredUniversities3 = dataSearch3.search();

  print(
      'Professors from Lviv universities which first name starts with "A-J": \n');
  for (final university in filteredUniversities3) {
    print(university.name + ':');
    for (final department in university.departments) {
      for (final professor in department.professors) {
        print('${professor.firstName} ${professor.lastName}');
      }
    }
    print('\n');
  }

  // example4
  print('example 4');
  var dataSearch4 = DataSearch4<University, Department, Professor, String>(
      data: universities,
      childrenPath1: ChildrenPath(
        (parent) => parent.departments,
        (parent, children) => parent.copyWith(departments: children.toList()),
      ),
      childrenPath2: ChildrenPath(
        (parent) => parent.professors,
        (parent, children) => parent.copyWith(professors: children.toSet()),
        searchMethod: (professor) =>
            professor.firstName.startsWith(RegExp(r'[A-J]')),
      ),
      childrenPath3: ChildrenPath(
        (parent) => parent.emails,
        (parent, children) => parent.copyWith(emails: children.toSet()),
        searchMethod: (email) => email.endsWith('@gmail.com'),
      ),
      searchMethod: (uni) => uni.name.contains('Lviv'));

  final filteredUniversities4 = dataSearch4.search();

  print(
      'Lviv professors which first name starts with "A-J" and have at leat one Google email: \n');
  for (final university in filteredUniversities4) {
    print(university.name + ':');
    for (final department in university.departments) {
      for (final professor in department.professors) {
        print(
            '${professor.firstName} ${professor.lastName} : ${professor.emails.reduce((value, element) => value + ', ' + element)}');
      }
    }
    print('\n');
  }
}
