// ignore_for_file: avoid_print

import 'package:mapster/mapster.dart';

import 'models/models.dart';

class UserToUserResponseMapper extends OneSourceMapper<User, UserResponse> {
  UserToUserResponseMapper(super.input);

  @override
  UserResponse map() {
    return UserResponse(
      id: source.id,
      fullName: '${source.firstName} ${source.lastName}',
    );
  }
}

void oneSourceExample(Mapster mapster) {
  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  final userResponse = mapster.map1(user, To<UserResponse>());

  print(userResponse);
}

class UserPostToPostResponse
    extends TwoSourcesMapper<User, Post, PostResponse> {
  UserPostToPostResponse(super.input);

  @override
  PostResponse map() {
    return PostResponse(
      id: source2.id,
      text: source2.text,
      userID: source1.id,
      userName: '${source1.firstName} ${source1.lastName}',
    );
  }
}

void twoSourcesExample(Mapster mapster) {
  mapster.register(MapperMeta.two(UserPostToPostResponse.new));

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
  final postResponse1 = mapster.map2(user, post, To<PostResponse>());
  final postResponse2 = mapster.map2(post, user, To<PostResponse>());

  print(postResponse1);
  print(postResponse2);
}

class UserUserPostToLikedPostNotification
    extends ThreeSourcesMapper<User, User, Post, LikedPostNotification> {
  UserUserPostToLikedPostNotification(super.input);

  @override
  LikedPostNotification map() {
    return LikedPostNotification(
      postID: _post.id,
      authorID: _user1.id,
      likeUserID: _user2.id,
      postText: _post.text,
      authorName: '${_user1.firstName} ${_user1.lastName}',
      likeUserName: '${_user2.firstName} ${_user2.lastName}',
    );
  }

  User get _user1 => source1;

  User get _user2 => source2;

  Post get _post => source3;
}

void threeSourcesExample(Mapster mapster) {
  mapster.register(MapperMeta.three(UserUserPostToLikedPostNotification.new));

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
    To<LikedPostNotification>(),
  );
  final notification2 = mapster.map3(
    likeUser,
    user,
    post,
    To<LikedPostNotification>(),
  );

  print(notification1);
  print(notification2);
}

class ToUserInfoResponseDTO {
  const ToUserInfoResponseDTO({
    required this.id,
    required this.firstName,
    this.lastName,
    this.phone,
  });

  final int id;
  final String firstName;
  final String? lastName;
  final String? phone;
}

class UserInfoToUserInfoResponseMapper
    extends OneSourceMapper<ToUserInfoResponseDTO, UserInfoResponse> {
  UserInfoToUserInfoResponseMapper(super.input);

  @override
  UserInfoResponse map() {
    var fullName = source.firstName;

    final lastName = source.lastName;
    if (lastName != null) {
      fullName += ' $lastName';
    }

    return UserInfoResponse(
      id: source.id,
      fullName: fullName,
      phone: source.phone,
    );
  }
}

void exampleWithDTO(Mapster mapster) {
  /// If you need to pass `null` create special DTO for it.
  final dto = ToUserInfoResponseDTO(
    id: 1,
    firstName: 'Harry',
    lastName: null,
    phone: null,
  );

  mapster.register(MapperMeta.one(UserInfoToUserInfoResponseMapper.new));

  print(mapster.map1(dto, To<UserInfoResponse>()));
}

class AnotherUserToUserResponseMapper
    extends OneSourceMapper<User, UserResponse> {
  AnotherUserToUserResponseMapper(super.input);

  @override
  UserResponse map() {
    return UserResponse(
      id: source.id,
      fullName: '${source.lastName} ${source.firstName}',
    );
  }
}

void redefineOneSourceExample(Mapster mapster) {
  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  print(mapster.map1(user, To<UserResponse>()));

  // You can redefine mappers
  // Mapster stores Mappers based on its source types and result type.
  // If new Mapper has the same set of input types and the same output type as
  // the old Mapper, then Mapster replaces old one with a new one.
  mapster.register(MapperMeta.one(AnotherUserToUserResponseMapper.new));

  print(mapster.map1(user, To<UserResponse>()));
}

void main() {
  final mapster = Mapster();

  oneSourceExample(mapster);
  twoSourcesExample(mapster);
  threeSourcesExample(mapster);
  exampleWithDTO(mapster);
  redefineOneSourceExample(mapster);
}
