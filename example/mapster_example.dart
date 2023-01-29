// ignore_for_file: avoid_print

import 'package:mapster/mapster.dart';

import 'models/models.dart';

class UserToUserResponseMapper extends OneSourceMapper<User, UserResponse> {
  const UserToUserResponseMapper();

  @override
  UserResponse map(User object) {
    return UserResponse(
      id: object.id,
      fullName: '${object.firstName} ${object.lastName}',
    );
  }
}

void oneSourceExample(Mapster mapster) {
  mapster.register(const UserToUserResponseMapper());

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  final userResponse = mapster.map<User, UserResponse>(user);

  print(userResponse);
}

class UserPostToPostResponse
    extends TwoSourcesMapper<User, Post, PostResponse> {
  const UserPostToPostResponse();

  @override
  PostResponse map(User object1, Post object2) {
    return PostResponse(
      id: object2.id,
      text: object2.text,
      userID: object1.id,
      userName: '${object1.firstName} ${object1.lastName}',
    );
  }
}

void twoSourcesExample(Mapster mapster) {
  mapster.register(const UserPostToPostResponse());

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  const post = Post(
    id: 1,
    text: "The philosopher's stone",
  );

  // You can swap `FROM` types, the result will be the same
  final postResponse1 = mapster.map2<User, Post, PostResponse>(user, post);
  final postResponse2 = mapster.map2<Post, User, PostResponse>(post, user);

  print(postResponse1);
  print(postResponse2);
}

class UserUserPostToLikedPostNotification
    extends ThreeSourcesMapper<User, User, Post, LikedPostNotification> {
  const UserUserPostToLikedPostNotification();

  @override
  LikedPostNotification map(User object1, User object2, Post object3) {
    return LikedPostNotification(
      postID: object3.id,
      authorID: object1.id,
      likeUserID: object2.id,
      postText: object3.text,
      authorName: '${object1.firstName} ${object1.lastName}',
      likeUserName: '${object2.firstName} ${object2.lastName}',
    );
  }
}

void threeSourcesExample(Mapster mapster) {
  mapster.register(const UserUserPostToLikedPostNotification());

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  const post = Post(
    id: 1,
    text: "The philosopher's stone",
  );

  const likeUser = User(
    id: 2,
    firstName: 'Ronald',
    lastName: 'Weasley',
  );

  // You can swap `FROM` types, but if you swap multiple objects of the same type,
  // the result WILL change.
  // So, you should avoid creating Mappers with multiple objects of the same type.
  final notification1 = mapster.map3<User, User, Post, LikedPostNotification>(
    user,
    likeUser,
    post,
  );
  final notification2 = mapster.map3<User, User, Post, LikedPostNotification>(
    likeUser,
    user,
    post,
  );

  print(notification1);
  print(notification2);
}

void main() {
  final mapster = Mapster();

  oneSourceExample(mapster);
  twoSourcesExample(mapster);
  threeSourcesExample(mapster);
}
