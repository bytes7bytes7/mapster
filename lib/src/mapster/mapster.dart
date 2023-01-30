import 'dart:collection';

import '../mappers/mappers.dart';
import 'exceptions/exceptions.dart';

part 'mapster_impl.dart';

/// Type of function that creates [TO].
/// Needed for [to] function.
typedef TOCreator<TO> = TO Function();

/// Very helpful function for [Mapster].
/// Do NOT call it (because it throws),
/// just pass it to one of [Mapster]'s `map` function, like that:
///
/// ```dart
/// final result = mapster.map(user, to<Result>);
/// ```
TO to<TO extends Object>() => throw Exception(
      'Do NOT call this function. '
      'You probably use `to<SomeType>()`. '
      'If so, remove parenthesis like that: `to<SomeType>`',
    );

/// Class that contains all registered [Mapper]
/// and use the proper [Mapper] for mapping
/// based on types.
abstract class Mapster {
  factory Mapster() = _MapsterImpl;

  /// Use this method to register your [Mapper]
  /// before using [Mapster].
  /// [Mapster] stores [Mapper]s based on its source types and result type.
  /// If new [Mapper] has the same set of input types and the same output type as
  /// the old [Mapper], then [Mapster] replaces old one with a new one.
  /// You can register multiple [Mapper]s at one.
  /// For this check [registerAll].
  void register(Mapper mapper);

  /// Use this method to register multiple [Mapper]s
  /// at once.
  void registerAll(List<Mapper> mappers);

  /// Map 1 object of type [FROM] to another object of type [TO].
  TO map<FROM extends Object, TO extends Object>(
    FROM object,
    TOCreator<TO> _,
  );

  /// Map 2 objects of types [FROM1], [FROM2] to another object of type [TO].
  TO map2<FROM1 extends Object, FROM2 extends Object, TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    TOCreator<TO> _,
  );

  /// Map 3 objects of types [FROM1], [FROM2], [FROM3]
  /// to another object of type [TO].
  TO map3<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    TOCreator<TO> _,
  );

  /// Map 4 objects of types [FROM1], [FROM2], [FROM3], [FROM4]
  /// to another object of type [TO].
  TO map4<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    TOCreator<TO> _,
  );

  /// Map 5 objects of types [FROM1], [FROM2], [FROM3], [FROM4], [FROM5]
  /// to another object of type [TO].
  TO map5<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, FROM5 extends Object, TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    TOCreator<TO> _,
  );

  /// Map 6 objects of types [FROM1], [FROM2], [FROM3], [FROM4], [FROM5],
  /// [FROM6] to another object of type [TO].
  TO map6<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    TOCreator<TO> _,
  );

  /// Map 7 objects of types [FROM1], [FROM2], [FROM3], [FROM4], [FROM5],
  /// [FROM6], [FROM7] to another object of type [TO].
  TO map7<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      FROM7 extends Object,
      TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    TOCreator<TO> _,
  );

  /// Map 8 objects of types [FROM1], [FROM2], [FROM3], [FROM4], [FROM5],
  /// [FROM6], [FROM7], [FROM8] to another object of type [TO].
  TO map8<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      FROM7 extends Object,
      FROM8 extends Object,
      TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
    TOCreator<TO> _,
  );

  /// Map 9 objects of types [FROM1], [FROM2], [FROM3], [FROM4], [FROM5],
  /// [FROM6], [FROM7], [FROM8], [FROM9] to another object of type [TO].
  TO map9<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      FROM7 extends Object,
      FROM8 extends Object,
      FROM9 extends Object,
      TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
    FROM9 object9,
    TOCreator<TO> _,
  );
}
