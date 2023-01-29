class PostResponse {
  const PostResponse({
    required this.id,
    required this.text,
    required this.userID,
    required this.userName,
  });

  final int id;
  final String text;
  final int userID;
  final String userName;

  @override
  String toString() => '$PostResponse {'
      'id: $id, '
      'text: $text, '
      'userID: $userID, '
      'userName: $userName'
      '}';
}
