# Mapster

Mapster is an object mapping library.

## How to use

1. Extend one of `Mapper` classes. There are 9 types: `OneSourceMapper`, `TwoSourcesMapper`, ...
   , `NineSourcesMapper`. Extend `OneSourceMapper`, if you need to map 1 object to another.
   Extend `TwoSourcesMapper`, if you need to map 2 objects to another, and so on up to 9 source
   objects.

 ```dart
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
```

2. Create `Mapster` instance.

```dart
void main() {
  final mapster = Mapster();
}
```

3. Register all your mappers in created instance of `Mapster`.

```dart
void main() {
  final mapster = Mapster();

  mapster.register(const UserToUserResponseMapper());
}
```

4. And use `Mapster`!

```dart
void main() {
  final mapster = Mapster();

  mapster.register(const UserToUserResponseMapper());

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  final userResponse = mapster.map<User, UserResponse>(user);
}
```

## Generic types

You must specify generic types when you call `Mapster`'s methods: `map`, `map2`, ... , `map9`.
First, specify all source types and then specify an output type. An output type must be the last.

You can swap source types in `Mapster`'s `map` methods as you wish. You do not need to check the
order of input types every time. `Mapster` is smart enough to find a proper `Mapper`.

```dart
class UserPostToPostResponse extends TwoSourcesMapper<User, Post, PostResponse> {
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

void main() {
  final mapster = Mapster();

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

  // You can swap source types, the result will be the same
  final postResponse1 = mapster.map2<User, Post, PostResponse>(user, post);
  final postResponse2 = mapster.map2<Post, User, PostResponse>(post, user);
}
```

Be aware of `Mapper`s with multiple source objects of the same type. Under the hood, `Mapster`
matches all input objects in order they are passed. For example, let's look at this code:

```dart
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

void main() {
  final mapster = Mapster();

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

  // You can swap source types, but if you swap multiple objects of the same type,
  // the result WILL change.
  // Mapster does its the maximum. But it is not able to define the right order
  // for multiple objects of the same type.
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
}
```

## Pros

- Mapster package has no dependency
- Mapster has O(1) time complexity of search for a proper Mapper
- Do not need to inject your classes/functions with large amount of mappers anymore. Just inject
  with Mapster
- Do not need to worry about the order of parameters
- Do not need to know a specific mapper to map
- Specify mappers in a one place

## Cons

- Mapster has O(n^2) time complexity of ordering arguments before passing them to a Mapper
