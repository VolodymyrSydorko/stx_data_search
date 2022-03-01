class Professor {
  Professor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emails,
  });

  final int id;
  final String firstName;
  final String lastName;
  Set<String> emails;

  Professor copyWith({
    int? id,
    String? firstName,
    String? lastName,
    Set<String>? emails,
  }) {
    return Professor(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emails: emails ?? this.emails,
    );
  }
}

class Department {
  Department({
    required this.id,
    required this.name,
    required this.processors,
  });

  final int id;
  final String name;
  final Set<Professor> processors;

  Department copyWith({
    int? id,
    String? name,
    Set<Professor>? processors,
  }) {
    return Department(
      id: id ?? this.id,
      name: name ?? this.name,
      processors: processors ?? this.processors,
    );
  }
}

class University {
  University({
    required this.id,
    required this.name,
    required this.departments,
  });

  final int id;
  final String name;
  final List<Department> departments;

  University copyWith({
    int? id,
    String? name,
    List<Department>? departments,
  }) {
    return University(
      id: id ?? this.id,
      name: name ?? this.name,
      departments: departments ?? this.departments,
    );
  }
}

final universities = [
  University(
    id: 1,
    name: 'National Technical University of Ukraine Kyiv Polytechnic Institute',
    departments: [
      Department(
        id: 1,
        name: 'Faculty of Welding',
        processors: {
          Professor(
            id: 1,
            firstName: 'James',
            lastName: 'Smith',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'John',
            lastName: 'Johnson',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 2,
        name: 'Faculty of Biomedical Engineering',
        processors: {
          Professor(
            id: 1,
            firstName: 'Michael',
            lastName: 'Locksley',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'William',
            lastName: 'Williams',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 3,
        name: 'Faculty of Radio Engineering',
        processors: {
          Professor(
            id: 1,
            firstName: 'David',
            lastName: 'Brown',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Richard',
            lastName: 'Jones',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
    ],
  ),
  University(
    id: 2,
    name: 'Taras Shevchenko National University of Kyiv',
    departments: [
      Department(
        id: 1,
        name: 'Faculty of Chemistry',
        processors: {
          Professor(
            id: 1,
            firstName: 'Thomas',
            lastName: 'Garcia',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Alan',
            lastName: 'Miller',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 2,
        name: 'Faculty of Geography',
        processors: {
          Professor(
            id: 1,
            firstName: 'Charles',
            lastName: 'Davis',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Christopher',
            lastName: 'Rodriguez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 3,
        name: 'Faculty of History',
        processors: {
          Professor(
            id: 1,
            firstName: 'Daniel',
            lastName: 'Martinez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Matthew',
            lastName: 'Hernandez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
    ],
  ),
  University(
    id: 3,
    name: 'National University of Kyiv-Mohyla Academy',
    departments: [
      Department(
        id: 1,
        name: 'Faculty of Applied Mathematics and Informatics',
        processors: {
          Professor(
            id: 1,
            firstName: 'Anthony',
            lastName: 'Lopez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Kevin',
            lastName: 'Gonzales',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 2,
        name: 'Faculty of International Relations',
        processors: {
          Professor(
            id: 1,
            firstName: 'Brian',
            lastName: 'Wilson',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Jason',
            lastName: 'Anderson',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 3,
        name: 'Faculty of Philology',
        processors: {
          Professor(
            id: 1,
            firstName: 'Jeffrey',
            lastName: 'Taylor',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'George',
            lastName: 'Moore',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
    ],
  ),
  University(
    id: 4,
    name: 'Ivan Franko National University of Lviv',
    departments: [
      Department(
        id: 1,
        name: 'Faculty of History',
        processors: {
          Professor(
            id: 1,
            firstName: 'Mark',
            lastName: 'Jackson',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Joshua',
            lastName: 'Martin',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 2,
        name: 'Faculty of Applied Mathematics and Informatics',
        processors: {
          Professor(
            id: 1,
            firstName: 'Ryan',
            lastName: 'Lee',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Jacob',
            lastName: 'Perez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 3,
        name: 'Faculty of Foreign Languages',
        processors: {
          Professor(
            id: 1,
            firstName: 'Gary',
            lastName: 'White',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Nicholas',
            lastName: 'Harris',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
    ],
  ),
  University(
    id: 5,
    name: 'Lviv Polytechnic National University',
    departments: [
      Department(
        id: 1,
        name: 'Faculty of Applied Mathematics and Informatics',
        processors: {
          Professor(
            id: 1,
            firstName: 'Larry',
            lastName: 'Sanchez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Samuel',
            lastName: 'Clark',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 2,
        name: 'Faculty of History',
        processors: {
          Professor(
            id: 1,
            firstName: 'Frank',
            lastName: 'Ramirez',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Patrick',
            lastName: 'Lewis',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 3,
        name: 'Faculty of Geology',
        processors: {
          Professor(
            id: 1,
            firstName: 'Jack',
            lastName: 'Robinson',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Scott',
            lastName: 'Walker',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
    ],
  ),
  University(
    id: 6,
    name: 'Borys Grinchenko Kyiv University',
    departments: [
      Department(
        id: 1,
        name: 'Faculty of Health, Physical Education and Sports',
        processors: {
          Professor(
            id: 1,
            firstName: 'Jerry',
            lastName: 'Young',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Tyler',
            lastName: 'Allen',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 2,
        name: 'Institute of Arts',
        processors: {
          Professor(
            id: 1,
            firstName: 'Jose',
            lastName: 'King',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Adam',
            lastName: 'Scott',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
      Department(
        id: 3,
        name: 'Institute of Human Sciences',
        processors: {
          Professor(
            id: 1,
            firstName: 'Patrick',
            lastName: 'Torres',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
          Professor(
            id: 1,
            firstName: 'Dennis',
            lastName: 'Hill',
            emails: {'test@test.com', 'test@gmail.com'},
          ),
        },
      ),
    ],
  ),
];
