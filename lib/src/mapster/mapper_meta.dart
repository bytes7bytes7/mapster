import '../mappers/mappers.dart';

/// Callback for creating [Mapper].
typedef MapperCreator<M extends Mapper> = M Function(MapperInput input);

/// Additional info about [Mapper] that needed during registering [Mapper].
class MapperMeta {
  MapperMeta({
    required this.from,
    required this.to,
    required this.mapperCreator,
  });

  /// List of source types.
  final List<Type> from;

  /// [To] with output type.
  final To to;

  /// Function that creates [Mapper].
  final MapperCreator mapperCreator;

  /// Creates [MapperMeta] for [OneSourceMapper].
  static MapperMeta one<FROM extends Object, TO extends Object>(
    MapperCreator<OneSourceMapper<FROM, TO>> mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [TwoSourcesMapper].
  static MapperMeta
      two<FROM1 extends Object, FROM2 extends Object, TO extends Object>(
    MapperCreator<TwoSourcesMapper<FROM1, FROM2, TO>> mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [ThreeSourcesMapper].
  static MapperMeta three<FROM1 extends Object, FROM2 extends Object,
      FROM3 extends Object, TO extends Object>(
    MapperCreator<ThreeSourcesMapper<FROM1, FROM2, FROM3, TO>> mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [FourSourcesMapper].
  static MapperMeta four<FROM1 extends Object, FROM2 extends Object,
      FROM3 extends Object, FROM4 extends Object, TO extends Object>(
    MapperCreator<FourSourcesMapper<FROM1, FROM2, FROM3, FROM4, TO>>
        mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [FiveSourcesMapper].
  static MapperMeta five<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      TO extends Object>(
    MapperCreator<FiveSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, TO>>
        mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [SixSourcesMapper].
  static MapperMeta six<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      TO extends Object>(
    MapperCreator<
            SixSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>>
        mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [SevenSourcesMapper].
  static MapperMeta seven<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      FROM7 extends Object,
      TO extends Object>(
    MapperCreator<
            SevenSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
                TO>>
        mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
        FROM7,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [EightSourcesMapper].
  static MapperMeta eight<
      FROM1 extends Object,
      FROM2 extends Object,
      FROM3 extends Object,
      FROM4 extends Object,
      FROM5 extends Object,
      FROM6 extends Object,
      FROM7 extends Object,
      FROM8 extends Object,
      TO extends Object>(
    MapperCreator<
            EightSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
                FROM8, TO>>
        mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
        FROM7,
        FROM8,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }

  /// Creates [MapperMeta] for [NineSourcesMapper].
  static MapperMeta nine<
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
    MapperCreator<
            NineSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
                FROM8, FROM9, TO>>
        mapperCreator,
  ) {
    return MapperMeta(
      from: [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
        FROM7,
        FROM8,
        FROM9,
      ],
      to: To<TO>(),
      mapperCreator: mapperCreator,
    );
  }
}
