# Mapster

Mapster is an object mapping library.

- [How to use](#how-to-use)
- [Map functions](#map-functions)
- [Pros & Cons](#pros--cons)
    - [Pros](#pros)
    - [Cons](#cons)
- [Other features](#other-features)
    - [registerAll](#registerall)
    - [Redefine Mapper](#redefine-mapper)

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

  final userResponse = mapster.map(user, to<UserResponse>);
}
```

Note that you should pass `to<YourResultType>` as last parameter. This way you specify what type
should `Mapster` return.

## Map functions

`Mapster` has 9 `map` methods: `map`, `map2`, ... , `map9`. All of them get source objects and
then `to<YourResultType>`.

You can pass source objects to `Mapster`'s `map` methods in any order. You do not need to check the
order of input objects in signature of certain `Mapper` every time. `Mapster` is smart enough to
find a proper `Mapper`.

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

  // You can swap source objects, the result will be the same
  final postResponse1 = mapster.map2(user, post, to<PostResponse>);
  final postResponse2 = mapster.map2(post, user, to<PostResponse>);
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
}
```

## Pros & Cons

### Pros

- Do not need to specify types in `<>` during using `register`, `registerAll`, and `map` functions
  of `Mapster`.
- `Mapster` package has no dependency
- `Mapster` has O(1) time complexity of searching for a proper `Mapper`
- Do not need to inject your classes/functions with large amount of mappers anymore. Just inject
  with `Mapster`
- Do not need to worry about the order of parameters
- Do not need to know a specific mapper to map
- Ability to specify mappers in a one place
- Ability to redefine `Mapper`s

### Cons

- `Mapster` has O(n^2) time complexity of ordering arguments before passing them to a `Mapper`

## Other features

### registerAll

You can register multiple `Mapper`s using `registerAll` method, like that:

```dart
void main() {
  final mapster = Mapster()
    ..registerAll(
      const [
        UserToUserResponseMapper(),
        UserUserPostToLikedPostNotification(),
      ],
    );
}
```

### Redefine Mapper

You can redefine `Mapper` by calling `register`/`registerAll` again, like that:

```dart
void main(Mapster mapster) {
  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Register Mapper with input type: User, and output type: UserResponse
  mapster.register(const UserToUserResponseMapper());

  final userResponse1 = mapster.map(user, to<UserResponse>);

  // Register another Mapper with the same types: 
  // input type: User, and output type: UserResponse
  mapster.register(const AnotherUserToUserResponseMapper());

  final userResponse2 = mapster.map(user, to<UserResponse>);
}
```

`Mapster` stores `Mapper`s based on its' source types and result type. If new `Mapper` has the same
set of input types (an order of input types does NOT matter) and the same output type as the
old `Mapper`, then `Mapster` replaces old one with a new one.

```dart
void main(Mapster mapster) {
  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Register Mapper with input type: User, and output type: UserResponse
  mapster.register(const UserToUserResponseMapper());

  final userResponse1 = mapster.map(user, to<UserResponse>);

  // Register another Mapper with swapped result and input types: 
  // input type: UserResponse, and output type: User
  mapster.register(const UserResponseToUserMapper());

  // Because input types set of the 1st Mapper contains
  // different types than input types set of the 2nd Mapper,
  // these two mappers considered as different.
  // Also we can say: because output type of the 1st Mapper not
  // equals to output type of the 2nd Mapper, these two
  // mappers considered as different.
  final user2 = mapster.map(userResponse1, to<User>);
}
```