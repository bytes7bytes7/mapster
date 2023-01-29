class LikedPostNotification {
  const LikedPostNotification({
    required this.postID,
    required this.authorID,
    required this.likeUserID,
    required this.postText,
    required this.authorName,
    required this.likeUserName,
  });

  final int postID;
  final int authorID;
  final int likeUserID;
  final String postText;
  final String authorName;
  final String likeUserName;

  @override
  String toString() => '$LikedPostNotification {'
      'postID: $postID, '
      'authorID: $authorID, '
      'likeUserID: $likeUserID, '
      'postText: $postText, '
      'authorName: $authorName, '
      'likeUserName: $likeUserName'
      '}';
}
