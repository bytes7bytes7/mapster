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

  final userResponse = mapster.map(user, to<UserResponse>);

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

  // You can swap source objects, the result will be the same
  final postResponse1 = mapster.map2(user, post, to<PostResponse>);
  final postResponse2 = mapster.map2(post, user, to<PostResponse>);

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

  // You can swap source objects, but if you swap multiple objects of the same type,
  // the result WILL change.
  // Mapster does its maximum. But Mapster is not able to define the right order
  // for multiple objects of the same type.
  // So, you should avoid creating Mappers with multiple objects of the same type.
  final notification1 = mapster.map3(
    user,
    likeUser,
    post,
    to<LikedPostNotification>,
  );
  final notification2 = mapster.map3(
    likeUser,
    user,
    post,
    to<LikedPostNotification>,
  );

  print(notification1);
  print(notification2);
}

class AnotherUserToUserResponseMapper
    extends OneSourceMapper<User, UserResponse> {
  const AnotherUserToUserResponseMapper();

  @override
  UserResponse map(User object) {
    return UserResponse(
      id: object.id,
      fullName: '${object.lastName} ${object.firstName}',
    );
  }
}

void redefineOneSourceExample(Mapster mapster) {
  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  mapster.register(const UserToUserResponseMapper());

  final userResponse1 = mapster.map(user, to<UserResponse>);

  // You can redefine mappers
  // Mapster stores Mappers based on its source types and result type.
  // If new Mapper has the same set of input types and the same output type as
  // the old Mapper, then Mapster replaces old one with a new one.
  mapster.register(const AnotherUserToUserResponseMapper());

  final userResponse2 = mapster.map(user, to<UserResponse>);

  print(userResponse1);
  print(userResponse2);
}

void main() {
  final mapster = Mapster();

  oneSourceExample(mapster);
  twoSourcesExample(mapster);
  threeSourcesExample(mapster);
  redefineOneSourceExample(mapster);
}
