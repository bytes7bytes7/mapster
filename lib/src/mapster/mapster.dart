import 'dart:collection';

import '../mappers/mappers.dart';
import 'exceptions/exceptions.dart';
import 'mapper_meta.dart';
import 'to.dart';

part 'mapster_impl.dart';

/// Class that contains all registered [MapperCreator]s.
/// and use the proper [Mapper] for mapping
/// based on input types and output type.
abstract class Mapster {
  factory Mapster() = _MapsterImpl;

  /// Use this method to register your [MapperCreator] via [MapperMeta]
  /// before using [Mapster].
  /// [Mapster] stores [MapperCreator]s based on it's [Mapper]'s source
  /// types and result type.
  /// If new [MapperCreator] creates [Mapper] that has the same
  /// set of input types and the same output type as
  /// the old [Mapper], then [Mapster] replaces old one with a new one.
  void register(
    MapperMeta mapperMeta,
  );

  /// Map 1 object of type [FROM] to another object of type [TO].
  TO map<FROM extends Object, TO extends Object>(
    FROM source,
    To<TO> to,
  );

  /// Map 2 objects of types [FROM1], [FROM2] to another object of type [TO].
  TO map2<FROM1 extends Object, FROM2 extends Object, TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    To<TO> to,
  );

  /// Map 3 objects of types [FROM1], [FROM2], [FROM3]
  /// to another object of type [TO].
  TO map3<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    To<TO> to,
  );

  /// Map 4 objects of types [FROM1], [FROM2], [FROM3], [FROM4]
  /// to another object of type [TO].
  TO map4<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    To<TO> to,
  );

  /// Map 5 objects of types [FROM1], [FROM2], [FROM3], [FROM4], [FROM5]
  /// to another object of type [TO].
  TO map5<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, FROM5 extends Object, TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    FROM5 source5,
    To<TO> to,
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
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    FROM5 source5,
    FROM6 source6,
    To<TO> to,
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
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    FROM5 source5,
    FROM6 source6,
    FROM7 source7,
    To<TO> to,
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
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    FROM5 source5,
    FROM6 source6,
    FROM7 source7,
    FROM8 source8,
    To<TO> to,
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
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    FROM5 source5,
    FROM6 source6,
    FROM7 source7,
    FROM8 source8,
    FROM9 source9,
    To<TO> to,
  );
}
