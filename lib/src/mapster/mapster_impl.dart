import '../mappers/mappers.dart';
import 'exceptions/exceptions.dart';
import 'mapster.dart';

bool _listEquals<T>(List<T> lst1, List<T> lst2) {
  for (final e1 in lst1) {
    if (!lst2.contains(e1)) {
      return false;
    }
  }

  return true;
}

class MapsterImpl implements Mapster {
  final _mappers = <Mapper>[];

  @override
  void register(Mapper mapper) {
    _mappers.add(mapper);
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [object],
    );

    return mapper.map(
      args[0],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
        object4,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
      args[3],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
        object4,
        object5,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
      args[3],
      args[4],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
        object4,
        object5,
        object6,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
      args[3],
      args[4],
      args[5],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
        object4,
        object5,
        object6,
        object7,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
      args[3],
      args[4],
      args[5],
      args[6],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
        object4,
        object5,
        object6,
        object7,
        object8,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
      args[3],
      args[4],
      args[5],
      args[6],
      args[7],
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

    final args = _sortArgs(
      mapper,
      neededFromTypes,
      [
        object1,
        object2,
        object3,
        object4,
        object5,
        object6,
        object7,
        object8,
        object9,
      ],
    );

    return mapper.map(
      args[0],
      args[1],
      args[2],
      args[3],
      args[4],
      args[5],
      args[6],
      args[7],
      args[8],
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

  Map<int, Object> _sortArgs<M extends Mapper>(
    M mapper,
    List<Type> neededFromTypes,
    List passedObjects,
  ) {
    final args = <int, Object>{};
    for (var i = 0; i < mapper.fromTypes.length; i++) {
      final type = mapper.fromTypes[i];
      final index = neededFromTypes.indexWhere((e) => e == type);

      args[i] = passedObjects[index];
    }

    return args;
  }
}
