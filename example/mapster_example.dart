// ignore_for_file: avoid_print

import 'package:mapster/mapster.dart';

import 'post.dart';
import 'post_response.dart';
import 'user.dart';
import 'user_response.dart';

class UserToUserResponseMapper implements OneSourceMapper<User, UserResponse> {
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
  mapster.register(UserToUserResponseMapper());

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  final userResponse = mapster.map<User, UserResponse>(user);

  print(userResponse);
}

class UserAndPostToPostResponse
    implements TwoSourcesMapper<User, Post, PostResponse> {
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
  mapster.register(UserAndPostToPostResponse());

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  const post = Post(
    id: 1,
    text: "The philosopher's stone",
  );

  // You can spawn `FROM` types, the result will be the same
  final postResponse1 = mapster.map2<User, Post, PostResponse>(user, post);
  final postResponse2 = mapster.map2<Post, User, PostResponse>(post, user);

  print(postResponse1);
  print(postResponse2);
}

void main() {
  final mapster = Mapster();

  oneSourceExample(mapster);
  twoSourcesExample(mapster);
}
