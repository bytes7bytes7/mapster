class UserInfoResponse {
  const UserInfoResponse({
    required this.id,
    required this.fullName,
    this.phone,
  });

  final int id;
  final String fullName;
  final String? phone;

  @override
  String toString() => '$UserInfoResponse {'
      'id: $id, '
      'fullName: $fullName, '
      'phone: ${phone ?? ''}'
      '}';
}
