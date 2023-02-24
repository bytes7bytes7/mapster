[English](https://github.com/bytes7bytes7/mapster/blob/master/README.md)
| [Русский](https://github.com/bytes7bytes7/mapster/blob/master/resources/l10n/ru_RU/README.md)

# Mapster

Mapster is an object mapping library.

- [How to use](#how-to-use)
- [Map functions](#map-functions)
- [Pros & Cons](#pros--cons)
    - [Pros](#pros)
    - [Cons](#cons)
- [Other features](#other-features)
    - [Redefine Mapper](#redefine-mapper)
- [Work with injectable](#work-with-injectable)

## How to use

1. Extend one of `Mapper` classes. There are 9 types: `OneSourceMapper`, `TwoSourcesMapper`, ...
   , `NineSourcesMapper`. Extend `OneSourceMapper`, if you need to map 1 object to another.
   Extend `TwoSourcesMapper`, if you need to map 2 objects to another, and so on up to 9 source
   objects.

 ```dart
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
```

2. Create `Mapster` instance.

```dart
void main() {
  final mapster = Mapster();
}
```

3. Register all your `Mapper`s in created instance of `Mapster`. Use `MapperMeta`'s static
   methods: `one`, `two`, ... , `nine` depend on `Mapper` type.

```dart
void main() {
  final mapster = Mapster();

  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));
}
```

4. And use `Mapster`!

```dart
void main() {
  final mapster = Mapster();

  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  final userResponse = mapster.map1(user, To<UserResponse>());
}
```

Note that you should pass `To<YourResultType>()` as last parameter. This way you specify what type
should `Mapster` return.

## Map functions

`Mapster` has 9 `map` methods: `map1`, `map2`, ... , `map9`. All of them get source objects and
then `To<YourResultType>()`.

You can pass source objects to `Mapster`'s `map` methods in any order. You do not need to check the
order of input objects in signature of certain `Mapper` every time. `Mapster` is smart enough to
find a proper `Mapper`.

```dart
class UserPostToPostResponse extends TwoSourcesMapper<User, Post, PostResponse> {
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

void main() {
  final mapster = Mapster();

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

  // You can swap source objects, the result will be the same.
  final postResponse1 = mapster.map2(user, post, To<PostResponse>());
  final postResponse2 = mapster.map2(post, user, To<PostResponse>());
}
```

Beware of `Mapper`s with multiple source objects of the same type. Under the hood, `Mapster`
matches all input objects in order they are passed. For example, let's look at this code:

```dart
class UserUserPostToLikedPostNotification
    extends ThreeSourcesMapper<User, User, Post, LikedPostNotification> {
  UserUserPostToLikedPostNotification(super.input);

  @override
  LikedPostNotification map() {
    return LikedPostNotification(
      postID: source3.id,
      authorID: source1.id,
      likeUserID: source2.id,
      postText: source3.text,
      authorName: '${source1.firstName} ${source1.lastName}',
      likeUserName: '${source2.firstName} ${source2.lastName}',
    );
  }
}

void main() {
  final mapster = Mapster();

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
}
```

## Pros & Cons

### Pros

- Do not need to specify types in `<>` during using `register` and `map` functions of `Mapster`
- Do not need to worry about the order of parameters
- Analyzer correctly determines a return type of `map` functions
- `Mapster` has O(1) time complexity of searching for a proper `Mapper`
- `Mapster` has O(n) time complexity (where n is an amount of parameters) of ordering arguments
  before passing them to a `Mapper`
- `Mapster` has no dependency
- Do not need to inject your classes/functions with large amount of mappers anymore. Just inject
  with `Mapster`
- Do not need to know a specific `Mapper` to map
- Ability to specify `Mapper`s in a one place
- Ability to redefine `Mapper`s

### Cons

- not found yet🙂

## Other features

### Redefine Mapper

You can redefine `Mapper` by calling `register` again, like that:

```dart
void main() {
  final mapster = Mapster();

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Register Mapper with input type: User, and output type: UserResponse.
  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  final userResponse1 = mapster.map1(user, To<UserResponse>());

  // Register another Mapper with the same types: 
  // input type: User, and output type: UserResponse.
  mapster.register(MapperMeta.one(AnotherUserToUserResponseMapper.new));

  final userResponse2 = mapster.map1(user, To<UserResponse>());
}
```

`Mapster` stores `Mapper`s based on its' source types and result type. If new `Mapper` has the same
set of input types (an order of input types does NOT matter) and the same output type as the
old `Mapper`, then `Mapster` replaces old one with a new one.

```dart
void main() {
  final mapster = Mapster();

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Register Mapper with input type: User, and output type: UserResponse.
  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  final userResponse1 = mapster.map1(user, To<UserResponse>());

  // Register another Mapper with swapped result and input types: 
  // input type: UserResponse, and output type: User.
  mapster.register(MapperMeta.one(UserResponseToUserMapper.new));

  // Because input types set of the 1st Mapper contains
  // different types than input types set of the 2nd Mapper,
  // these two mappers considered as different.
  // Also we can say: because output type of the 1st Mapper not
  // equals to output type of the 2nd Mapper, these two
  // mappers considered as different.
  final user2 = mapster.map1(userResponse1, To<User>());
}
```

## Work with injectable

If you use [injectable](https://pub.dev/packages/injectable) package, you can register `Mapster`
and `Mapper`s like that:

```dart
@module
abstract class MapsterModule {
  @singleton
  Mapster get mapster => Mapster();
}

@singleton
class MapsterRegistrar {
  const MapsterRegistrar(this._mapster);

  final Mapster _mapster;

  @postConstruct
  void register() {
    _mapster..register(
      MapperMeta.one(UserToUserResponseMapper.new),
    )..register(
      MapperMeta.three(UserUserPostToLikedPostNotification.new),
    );
  }
}
```

We won't use `MapsterRegistrar` class. But it's useful to us, because `@singleton`s can
have `@postConstruct` method. So, this way, we can register `Mapster` and all our `Mapper`s
in `get_it`.

If you use feature-first or layer-first approach in you project, you can declare
multiple `MapsterRegistrar` in multiple places with the same name, but do NOT try to
get `MapsterRegister` from `get_it`, if you creates multiple `MasterRegistrar` with the same name,
because it can cause a problem. Remember, that we do not need to get `MapsterRegistrar`, we creates
it only to use `@postConstruct`.