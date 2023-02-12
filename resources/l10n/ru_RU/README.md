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
    - [Переопределение Mapper](#переопределение-Mapper)
- [Работа с injectable](#работа-с-injectable)

## Как использовать

1. Наследуйтесь от одного из `Mapper` классов. Существует 9 типов: `OneSourceMapper`
   , `TwoSourcesMapper`, ... , `NineSourcesMapper`. Наследуйтесь от `OneSourceMapper`, если вам
   нужно преобразовать 1 объект в другой. Наследуйтесь от `TwoSourcesMapper`, если вам нужно
   преобразовать 2 объекта в другой, и т.д. до 9 объектов-источников.

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

2. Создайте экземпляр класса `Mapster`.

```dart
void main() {
  final mapster = Mapster();
}
```

3. Зарегистрируйте все `Mapper`'ы в созданном экземпляре `Mapster`. Используйте статические
   методы `MapperMeta`: `one`, `two`, ... , `nine` в зависимости от типа `Mapper`'а.

```dart
void main() {
  final mapster = Mapster();

  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));
}
```

4. И наконец, воспользуйтесь `Mapster`!

```dart
void main() {
  final mapster = Mapster();

  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  final userResponse = mapster.map(user, To<UserResponse>());
}
```

Обратите внимание на то, что вам необходимо последним аргументом передавать `To<YourResultType>()`.
Таким образом вы указываете, в какой тип `Mapster` должен преобразовать объект.

## Map функции

`Mapster` имеет 9 `map` методов: `map`, `map2`, ... , `map9`. Каждый метод принимает входные данные
и затем `To<YourResultType>()`.

Вы можете передавать объекты-источники в `map` метод `Mapster`'а в любом порядке. Вам не нужно
каждый раз проверять порядок входных данных в сигнатуре какого-то конкретного `Mapper`'а. `Mapster`
достаточно умен, чтобы найти подходящий `Mapper`.

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

  // Вы можете менять местами объекты-источники, результат будет одинаковым.
  final postResponse1 = mapster.map2(user, post, To<PostResponse>());
  final postResponse2 = mapster.map2(post, user, To<PostResponse>());
}
```

Остерегайтесь `Mapper`'ов с несколькими входными объектами одного типа. Под капотом, `Mapster`
сопоставляет входные данные, основываясь на порядке, в котором они были переданы. Например,
рассмотрим данный код:

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

  // Вы можете менять местами входные объекты, однако, если поменять местами
  // объекты одного типа, то результат ИЗМЕНИТСЯ.
  // Mapster делает максимум. Но он никак не может определить верный порядок для
  // нескольких объектов одного и того же типа.
  // Поэтому вам не стоит создавать Mapper'ы с несколькими входными объектами одного типа.
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

## Плюсы и минусы

### Плюсы

- Вам не нужно указывать типы в `<>` при использовании `register`, `registerAll` и `map`
  функций `Mapster`'а
- Вам не нужно волноваться о порядке параметров
- Анализатор верно определяет возвращаемый тип `map` функций
- `Mapster` имеет временную сложность О(1) поиска подходящего `Mapper`'а
- `Mapster` имеет временную сложность О(n) (где n - количество параметров) упорядочивания входных
  объектов перед передачей их в `Mapper`
- `Mapster` не имеет зависимостей
- Вам больше не потребуется передавать огромное количество мапперов в ваши классы/функции. Добавьте
  только `Mapster`
- Вам не нужно выяснять, какой конкретно `Mapper` вам нужен
- Возможность указывать `Mapper`'ы в одном месте
- Возможность переопределять `Mapper`'ы

### Минусы

- пока не найдены🙂

## Другие особенности

### Переопределение Mapper

Вы можете переопределить `Mapper`, повторно воспользовавшись `register` следующим образом:

```dart
void main() {
  final mapster = Mapster();

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Регистрация Mapper'а с входным типом: User и выходным типом: UserResponse
  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  final userResponse1 = mapster.map(user, To<UserResponse>());

  // Регистрация другого Mapper'а с теми же типами: 
  // входной тип: User, выходной тип: UserResponse
  mapster.register(MapperMeta.one(AnotherUserToUserResponseMapper.new));

  final userResponse2 = mapster.map(user, To<UserResponse>());
}
```

`Mapster` хранит `Mapper`'ы, основываясь на их входных типах и выходном типе. Если новый `Mapper`
имеет тот же набор входных типов (поряд входных типов НЕ имеет значения) и тот же выходной тип как у
старого `Mapper`, тогда `Mapster` заменит старый на новый.

```dart
void main() {
  final mapster = Mapster();

  const user = User(
    id: 1,
    firstName: 'Harry',
    lastName: 'Potter',
  );

  // Регистрация Mapper'а с входным типом: User и выходным типом: UserResponse
  mapster.register(MapperMeta.one(UserToUserResponseMapper.new));

  final userResponse1 = mapster.map(user, To<UserResponse>());

  // Регистрация другого Mapper'а с поменяными входным и выходным типами: 
  // входной тип: UserResponse, выходной тип: User
  mapster.register(MapperMeta.one(UserResponseToUserMapper.new));

  // Т. к. набор входных типов 1-го Mapper'а содержит
  // другие типы по сравнению с набором входных типов 2-го Mapper'а,
  // эти два Mapper'а считаются разными.
  // Также можно сказать: т. к. выходной тип 1-го Mapper'а не равен
  // выходному типу 2-го Mapper'а, эти два
  // Mapper'а считаются разными.
  final user2 = mapster.map(userResponse1, To<User>());
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
    _mapster..register(
      MapperMeta.one(UserToUserResponseMapper.new),
    )..register(
      MapperMeta.three(UserUserPostToLikedPostNotification.new),
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