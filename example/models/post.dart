class Post {
  const Post({
    required this.id,
    required this.text,
  });

  final int id;
  final String text;

  @override
  String toString() => '$Post {'
      'id: $id, '
      'text: $text'
      '}';
}
