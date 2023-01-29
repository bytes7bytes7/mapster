class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final int id;
  final String firstName;
  final String lastName;

  @override
  String toString() => '$User {'
      'id: $id, '
      'firstName: $firstName, '
      'lastName: $lastName'
      '}';
}
