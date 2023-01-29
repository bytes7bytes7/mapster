part of 'mapster.dart';

class _MapsterImpl implements Mapster {
  final _mappers = HashMap<int, Mapper>();

  @override
  void register(Mapper mapper) {
    _mappers[_getMapperUid(mapper.toType, mapper.fromTypes)] = mapper;
  }

  @override
  void registerAll(List<Mapper> mappers) {
    for (final mapper in mappers) {
      register(mapper);
    }
  }

  @override
  TO map<FROM, TO>(
    FROM object,
    TOCreator<TO> _,
  ) {
    final neededFromTypes = [FROM];

    final mapper = _findMapper<OneSourceMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(OneSourceMapper<FROM, TO>);
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [object];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
    );
  }

  @override
  TO map2<FROM1, FROM2, TO>(
    FROM1 object1,
    FROM2 object2,
    TOCreator<TO> _,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
    ];

    final mapper = _findMapper<TwoSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        TwoSourcesMapper<FROM1, FROM2, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
    );
  }

  @override
  TO map3<FROM1, FROM2, FROM3, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    TOCreator<TO> _,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
    ];

    final mapper = _findMapper<ThreeSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        ThreeSourcesMapper<FROM1, FROM2, FROM3, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
    );
  }

  @override
  TO map4<FROM1, FROM2, FROM3, FROM4, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    TOCreator<TO> _,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
    ];

    final mapper = _findMapper<FourSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        FourSourcesMapper<FROM1, FROM2, FROM3, FROM4, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
      passedObjects.removeAt(args[3]!),
    );
  }

  @override
  TO map5<FROM1, FROM2, FROM3, FROM4, FROM5, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    TOCreator<TO> _,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
    ];

    final mapper = _findMapper<FiveSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        FiveSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
      passedObjects.removeAt(args[3]!),
      passedObjects.removeAt(args[4]!),
    );
  }

  @override
  TO map6<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    TOCreator<TO> _,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
      FROM5,
      FROM6,
    ];

    final mapper = _findMapper<SixSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        SixSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
      object6,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
      passedObjects.removeAt(args[3]!),
      passedObjects.removeAt(args[4]!),
      passedObjects.removeAt(args[5]!),
    );
  }

  @override
  TO map7<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    TOCreator<TO> _,
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

    final mapper = _findMapper<SevenSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        SevenSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
      object6,
      object7,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
      passedObjects.removeAt(args[3]!),
      passedObjects.removeAt(args[4]!),
      passedObjects.removeAt(args[5]!),
      passedObjects.removeAt(args[6]!),
    );
  }

  @override
  TO map8<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7, FROM8, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
    TOCreator<TO> _,
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

    final mapper = _findMapper<EightSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        EightSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
            FROM8, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
      object6,
      object7,
      object8,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
      passedObjects.removeAt(args[3]!),
      passedObjects.removeAt(args[4]!),
      passedObjects.removeAt(args[5]!),
      passedObjects.removeAt(args[6]!),
      passedObjects.removeAt(args[7]!),
    );
  }

  @override
  TO map9<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7, FROM8, FROM9, TO>(
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

    final mapper = _findMapper<NineSourcesMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(
        NineSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
            FROM8, FROM9, TO>,
      );
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
      object6,
      object7,
      object8,
      object9,
    ];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
      passedObjects.removeAt(args[1]!),
      passedObjects.removeAt(args[2]!),
      passedObjects.removeAt(args[3]!),
      passedObjects.removeAt(args[4]!),
      passedObjects.removeAt(args[5]!),
      passedObjects.removeAt(args[6]!),
      passedObjects.removeAt(args[7]!),
      passedObjects.removeAt(args[8]!),
    );
  }

  int _getMapperUid(Type toType, List<Type> fromTypes) {
    return toType.hashCode ^ fromTypes.fold(0, (r, e) => r ^ e.hashCode);
  }

  M? _findMapper<M extends Mapper>(
    List<Type> neededFromTypes,
    Type neededToType,
  ) {
    final mapper = _mappers[_getMapperUid(neededToType, neededFromTypes)];

    if (mapper is M?) {
      return mapper;
    }

    return null;
  }

  Map<int, int> _sortArgs<M extends Mapper>(
    M mapper,
    List<Type> neededFromTypes,
  ) {
    final fromTypes = List.from(neededFromTypes);
    final args = <int, int>{};

    for (var i = 0; i < mapper.fromTypes.length; i++) {
      final type = mapper.fromTypes[i];

      final index = fromTypes.indexWhere((e) => e == type);

      fromTypes.removeAt(index);
      args[i] = index;
    }

    return args;
  }
}
