[English](https://github.com/bytes7bytes7/mapster/blob/master/README.md)
| [Русский](https://github.com/bytes7bytes7/mapster/blob/master/resources/l10n/ru_RU/README.md)

# Mapster

Mapster - библиотека конвертации объектов.

- [Как использовать](#как-использовать)
- [Map функции](#map-функции)
- [Плюсы и минусы](#плюсы-и-минусы)
    - [Плюсы](#плюсы)
    - [Минусы](#минусы)
- [Другие особенности](#другие-особенности)
    - [registerAll](#registerall)
    - [Переопределение Mapper](#переопределение-Mapper)
- [Работа с injectable](#работа-с-injectable)

## Как использовать

1. Наследуйтесь от одного из `Mapper` классов. Существует 9 типов: `OneSourceMapper`
   , `TwoSourcesMapper`, ... , `NineSourcesMapper`. Наследуйтесь от `OneSourceMapper`, если вам
   нужно преобразовать 1 объект в другой. Наследуйтесь от `TwoSourcesMapper`, если вам нужно
   преобразовать 2 объекта в другой, и т.д. до 9 объектов-источников.

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

2. Создайте экземпляр класса `Mapster`.

```dart
void main() {
  final mapster = Mapster();
}
```

3. Зарегистрируйте все `Mapper`'ы в созданном экземпляре `Mapster`.

```dart
void main() {
  final mapster = Mapster();

  mapster.register(const UserToUserResponseMapper());
}
```

4. И наконец, воспользуйтесь `Mapster`!

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

Обратите внимание на то, что вам необходимо последним аргументом передавать `to<YourResultType>`.
Таким образом вы указываете, в какой тип `Mapster` должен преобразовать объект.

## Map функции

`Mapster` имеет 9 `map` методов: `map`, `map2`, ... , `map9`. Каждый метод принимает входные данные
и затем `to<YourResultType>`.

Вы можете передавать объекты-источники в `map` метод `Mapster`'а в любом порядке. Вам не нужно
каждый раз проверять порядок входных данных в сигнатуре какого-то конкретного `Mapper`'а. `Mapster`
достаточно умен, чтобы найти подходящий `Mapper`.

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

  // Вы можете менять местами объекты-источники, результат будет одинаковым.
  final postResponse1 = mapster.map2(user, post, to<PostResponse>);
  final postResponse2 = mapster.map2(post, user, to<PostResponse>);
}
```

Остерегайтесь `Mapper`'ов с несколькими входными объектами одного типа. Под капотом, `Mapster`
сопоставляет входные данные, основываясь на порядке, в котором они были переданы. Например,
рассмотрим данный код:

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

  // Вы можете менять местами входные объекты, однако, если поменять местами
  // объекты одного типа, то результат ИЗМЕНИТСЯ.
  // Mapster делает максимум. Но он никак не может определить верный порядок для
  // нескольких объектов одного и того же типа.
  // Поэтому вам не стоит создавать Mapper'ы с несколькими входными объектами одного типа.
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

## Плюсы и минусы

### Плюсы

- Вам не нужно указывать типы в `<>` при использовании `register`, `registerAll` и `map`
  функций `Mapster`'а.
- `Mapster` не имеет зависимостей
- `Mapster` имеет временную сложность О(1) поиска подходящего `Mapper`'а
- Вам больше не потребуется передавать огромное количество мапперов в ваши классы/функции. Добавьте
  только `Mapster`
- Вам не нужно волноваться о порядке параметров
- Вам не нужно выяснять, какой конкретно `Mapper` вам нужен
- Возможность указывать `Mapper`'ы в одном месте
- Возможность переопределять `Mapper`'ы

### Минусы

- `Mapster` имеет временную сложность О(n^2) упорядочивания входных объектов перед передачей их
  в `Mapper`

## Другие особенности

### registerAll

Вы можете зарегистрировать несколько `Mapper`'ов, используя метод `registerAll`, следующим образом:

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

### Переопределение Mapper

Вы можете переопределить `Mapper`, повторно воспользовавшись `register`/`registerAll`, следующим
образом:

```dart
void main(Mapster mapster) {
  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Регистрация Mapper'а с входным типом: User и выходным типом: UserResponse
  mapster.register(const UserToUserResponseMapper());

  final userResponse1 = mapster.map(user, to<UserResponse>);

  // Регистрация другого Mapper'а с теми же типами: 
  // входной тип: User, выходной тип: UserResponse
  mapster.register(const AnotherUserToUserResponseMapper());

  final userResponse2 = mapster.map(user, to<UserResponse>);
}
```

`Mapster` хранит `Mapper`'ы, основываясь на их входных типах и выходном типе. Если новый `Mapper`
имеет тот же набор входных типов (поряд входных типов НЕ имеет значения) и тот же выходной тип как у
старого `Mapper`, тогда `Mapster` заменит старый на новый.

```dart
void main(Mapster mapster) {
  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Регистрация Mapper'а с входным типом: User и выходным типом: UserResponse
  mapster.register(const UserToUserResponseMapper());

  final userResponse1 = mapster.map(user, to<UserResponse>);

  // Регистрация другого Mapper'а с поменяными входным и выходным типами: 
  // входной тип: UserResponse, выходной тип: User
  mapster.register(const UserResponseToUserMapper());

  // Т. к. набор входных типов 1-го Mapper'а содержит
  // другие типы по сравнению с набором входных типов 2-го Mapper'а,
  // эти два Mapper'а считаются разными.
  // Также можно сказать: т. к. выходной тип 1-го Mapper'а не равен
  // выходному типу 2-го Mapper'а, эти два
  // Mapper'а считаются разными.
  final user2 = mapster.map(userResponse1, to<User>);
}
```

## Работа с injectable

Если вы используете [injectable](https://pub.dev/packages/injectable) пакет, вы можете
зарегистрировать `Mapster` и `Mapper`'ы следующим образом:

```dart
@module
class MapsterModule {
  @singleton
  Mapster get mapster => Mapster();
}

@singleton
class MapsterRegistrar {
  const MapsterRegistrar(this._mapster);

  final Mapster _mapster;

  @postConstruct
  void register() {
    _mediator.registerAll(
      [
        UserToUserResponseMapper(),
        UserUserPostToLikedPostNotification(),
      ],
    );
  }
}
```

Мы не будем использовать `MapsterRegistrar`. Но он полезен нам, т. к. `@singleton`'ы могут иметь
метод `@postConstruct`. Т. е., таким образом, мы может зарегистрировать `Mapster` и все
наши `Mapper`'ы в `get_it`.

Если вы используете feature-first или layer-first подход в вашем проекте, вы можете объявить
несколько `MapsterRegistrar`'ов в разных местах с одинаковым именем, но НЕ пытайтесь
получить `MapsterRegister` из `get_it`, если у вы создали несколько `MasterRegistrar`'ов с одним
именем, т. к. это может создать проблему. Помните, что нам не нужно обращаться к `MapsterRegistrar`'
у , мы создали его только для возможности воспользоваться `@postConstruct`.