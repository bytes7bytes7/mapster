part of 'mapster.dart';

bool _listEquals<T>(List<T> lst1, List<T> lst2) {
  for (final e1 in lst1) {
    if (!lst2.contains(e1)) {
      return false;
    }
  }

  return true;
}

class _MapsterImpl implements Mapster {
  final _mappers = <Mapper>[];

  @override
  void register(Mapper mapper) {
    _mappers.add(mapper);
  }

  @override
  void registerAll(List<Mapper> mappers) {
    _mappers.addAll(mappers);
  }

  @override
  TO map<FROM, TO>(FROM object) {
    final neededFromTypes = [FROM];

    final mapper = _findMapper<OneSourceMapper>(
      neededFromTypes,
      TO,
    );

    if (mapper == null) {
      throw MapperNotRegistered(OneSourceMapper<FROM, TO>);
    }

    final passedObjects = [object];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
    );
  }

  @override
  TO map2<FROM1, FROM2, TO>(FROM1 object1, FROM2 object2) {
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

    final passedObjects = [
      object1,
      object2,
    ];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
    );
  }

  @override
  TO map3<FROM1, FROM2, FROM3, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
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

    final passedObjects = [
      object1,
      object2,
      object3,
    ];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
    );
  }

  @override
  TO map4<FROM1, FROM2, FROM3, FROM4, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
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

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
    ];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
      passedObjects[args[3]!],
    );
  }

  @override
  TO map5<FROM1, FROM2, FROM3, FROM4, FROM5, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
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

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
    ];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
      passedObjects[args[3]!],
      passedObjects[args[4]!],
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

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
      object6,
    ];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
      passedObjects[args[3]!],
      passedObjects[args[4]!],
      passedObjects[args[5]!],
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

    final passedObjects = [
      object1,
      object2,
      object3,
      object4,
      object5,
      object6,
      object7,
    ];

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
      passedObjects[args[3]!],
      passedObjects[args[4]!],
      passedObjects[args[5]!],
      passedObjects[args[6]!],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
      passedObjects[args[3]!],
      passedObjects[args[4]!],
      passedObjects[args[5]!],
      passedObjects[args[6]!],
      passedObjects[args[7]!],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      passedObjects,
    );

    return mapper.map(
      passedObjects[args[0]!],
      passedObjects[args[1]!],
      passedObjects[args[2]!],
      passedObjects[args[3]!],
      passedObjects[args[4]!],
      passedObjects[args[5]!],
      passedObjects[args[6]!],
      passedObjects[args[7]!],
      passedObjects[args[8]!],
    );
  }

  M? _findMapper<M extends Mapper>(
    List<Type> neededFromTypes,
    Type neededToType,
  ) {
    M? mapper;

    for (final m in _mappers) {
      if (m is M) {
        final fromTypes = m.fromTypes;
        final toType = m.toType;

        if (toType == neededToType && _listEquals(fromTypes, neededFromTypes)) {
          mapper = m;
          break;
        }
      }
    }

    return mapper;
  }

  Map<int, int> _sortArgs<M extends Mapper>(
    M mapper,
    List<Type> neededFromTypes,
    List passedObjects,
  ) {
    final args = <int, int>{};
    for (var i = 0; i < mapper.fromTypes.length; i++) {
      final type = mapper.fromTypes[i];

      var startIndex = 0;
      var index = -1;
      while (true) {
        index = neededFromTypes.indexWhere((e) => e == type, startIndex);

        if (args.values.contains(index)) {
          startIndex = index + 1;
        } else {
          break;
        }
      }

      args[i] = index;
    }

    return args;
  }
}
