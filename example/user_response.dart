class UserResponse {
  const UserResponse({
    required this.id,
    required this.fullName,
  });

  final int id;
  final String fullName;

  @override
  String toString() => '$UserResponse {'
      'id: $id, '
      'fullName: $fullName'
      '}';
}
