part of 'mapster.dart';

class _MapsterImpl implements Mapster {
  final _mapperCreators = HashMap<String, MapperCreator>();

  @override
  void register(MapperCreator mapperCreator) {
    // Create mapper to get `to` and `fromTypes`
    final mapper = mapperCreator(MapperInput());

    _mapperCreators[_getMapperCreatorID(mapper.to, mapper.fromTypes)] =
        mapperCreator;
  }

  @override
  void registerAll(List<MapperCreator> mapperCreators) {
    for (final mapperCreator in mapperCreators) {
      register(mapperCreator);
    }
  }

  @override
  TO map<FROM extends Object, TO extends Object>(
    FROM source,
    To<TO> to,
  ) {
    final neededFromTypes = [
      FROM,
    ];

    final mapperCreator = _findMapperCreator<OneSourceMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<OneSourceMapper<FROM, TO>>>();
    }

    final sources = [
      source,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
  TO map2<FROM1 extends Object, FROM2 extends Object, TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    To<TO> to,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
    ];

    final mapperCreator = _findMapperCreator<TwoSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<TwoSourcesMapper<FROM1, FROM2, TO>>>();
    }

    final sources = [
      source1,
      source2,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
  TO map3<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    To<TO> to,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
    ];

    final mapperCreator = _findMapperCreator<ThreeSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<ThreeSourcesMapper<FROM1, FROM2, FROM3, TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
  TO map4<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    To<TO> to,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
    ];

    final mapperCreator = _findMapperCreator<FourSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<FourSourcesMapper<FROM1, FROM2, FROM3, FROM4, TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
      source4,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
  TO map5<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, FROM5 extends Object, TO extends Object>(
    FROM1 source1,
    FROM2 source2,
    FROM3 source3,
    FROM4 source4,
    FROM5 source5,
    To<TO> to,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
    ];

    final mapperCreator = _findMapperCreator<FiveSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<
              FiveSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
      source4,
      source5,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
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
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
      FROM6,
    ];

    final mapperCreator = _findMapperCreator<SixSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<
              SixSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6,
                  TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
      source4,
      source5,
      source6,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
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
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
      FROM6,
      FROM7,
    ];

    final mapperCreator = _findMapperCreator<SevenSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<
              SevenSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6,
                  FROM7, TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
      source4,
      source5,
      source6,
      source7,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
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
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
      FROM6,
      FROM7,
      FROM8,
    ];

    final mapperCreator = _findMapperCreator<EightSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<
              EightSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6,
                  FROM7, FROM8, TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
      source4,
      source5,
      source6,
      source7,
      source8,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  @override
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
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
      FROM6,
      FROM7,
      FROM8,
      FROM9,
    ];

    final mapperCreator = _findMapperCreator<NineSourcesMapper>(
      neededFromTypes,
      to,
    );

    if (mapperCreator == null) {
      throw MapperCreatorNotRegistered<
          MapperCreator<
              NineSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
                  FROM8, FROM9, TO>>>();
    }

    final sources = [
      source1,
      source2,
      source3,
      source4,
      source5,
      source6,
      source7,
      source8,
      source9,
    ];

    final input = _createInput(neededFromTypes, sources);

    final mapper = mapperCreator(input);

    return mapper.map() as TO;
  }

  String _getMapperCreatorID(To to, List<Type> fromTypes) => '${to.hashCode} '
      '${fromTypes.fold<int>(0, (r, e) => r ^ e.hashCode)}';

  MapperCreator<M>? _findMapperCreator<M extends Mapper>(
    List<Type> neededFromTypes,
    To to,
  ) {
    final mapperCreator =
        _mapperCreators[_getMapperCreatorID(to, neededFromTypes)];

    if (mapperCreator is MapperCreator<M>) {
      return mapperCreator;
    }

    return null;
  }

  MapperInput _createInput(
    List<Type> types,
    List<Object> sources,
  ) {
    final input = MapperInput();

    final typeIter = types.iterator..moveNext();
    final sourceIter = sources.iterator..moveNext();

    for (var i = 0; i < types.length; i++) {
      final type = typeIter.current;
      final source = sourceIter.current;

      if (input.containsKey(type)) {
        input[type]!.add(source);
      } else {
        input[type] = [source];
      }

      typeIter.moveNext();
      sourceIter.moveNext();
    }

    return input;
  }
}
