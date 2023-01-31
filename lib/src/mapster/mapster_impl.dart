part of 'mapster.dart';

class _MapsterImpl implements Mapster {
  final _mappers = HashMap<String, Mapper>();

  @override
  void register(Mapper mapper) {
    _mappers[_getMapperUid(mapper.to, mapper.fromTypes)] = mapper;
  }

  @override
  void registerAll(List<Mapper> mappers) {
    for (final mapper in mappers) {
      register(mapper);
    }
  }

  @override
  TO map<FROM extends Object, TO extends Object>(
    FROM object,
    To<TO> toCreator,
  ) {
    final neededFromTypes = [FROM];

    final mapper = _findMapper<OneSourceMapper>(
      neededFromTypes,
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<OneSourceMapper<FROM, TO>>();
    }

    final args = _sortArgs(
      mapper,
      neededFromTypes,
    );

    final passedObjects = [object];

    return mapper.map(
      passedObjects.removeAt(args[0]!),
    ) as TO;
  }

  @override
  TO map2<FROM1 extends Object, FROM2 extends Object, TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    To<TO> toCreator,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
    ];

    final mapper = _findMapper<TwoSourcesMapper>(
      neededFromTypes,
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<TwoSourcesMapper<FROM1, FROM2, TO>>();
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
    ) as TO;
  }

  @override
  TO map3<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    To<TO> toCreator,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
    ];

    final mapper = _findMapper<ThreeSourcesMapper>(
      neededFromTypes,
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<ThreeSourcesMapper<FROM1, FROM2, FROM3, TO>>();
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
    ) as TO;
  }

  @override
  TO map4<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    To<TO> toCreator,
  ) {
    final neededFromTypes = [
      FROM1,
      FROM2,
      FROM3,
      FROM4,
    ];

    final mapper = _findMapper<FourSourcesMapper>(
      neededFromTypes,
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<
          FourSourcesMapper<FROM1, FROM2, FROM3, FROM4, TO>>();
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
    ) as TO;
  }

  @override
  TO map5<FROM1 extends Object, FROM2 extends Object, FROM3 extends Object,
      FROM4 extends Object, FROM5 extends Object, TO extends Object>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    To<TO> toCreator,
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
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<
          FiveSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, TO>>();
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
    ) as TO;
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
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    To<TO> toCreator,
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
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<
          SixSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>>();
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
    ) as TO;
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
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    To<TO> toCreator,
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
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<
          SevenSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
              TO>>();
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
    ) as TO;
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
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
    To<TO> toCreator,
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
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<
          EightSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
              FROM8, TO>>();
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
    ) as TO;
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
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
    FROM9 object9,
    To<TO> toCreator,
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
      toCreator,
    );

    if (mapper == null) {
      throw MapperNotRegistered<
          NineSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7,
              FROM8, FROM9, TO>>();
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
    ) as TO;
  }

  String _getMapperUid(To toCreator, List<Type> fromTypes) =>
      '${toCreator.hashCode} '
      '${fromTypes.fold<int>(0, (r, e) => r ^ e.hashCode)}';

  M? _findMapper<M extends Mapper>(
    List<Type> neededFromTypes,
    To toCreator,
  ) {
    final mapper = _mappers[_getMapperUid(toCreator, neededFromTypes)];

    if (mapper is M) {
      return mapper;
    }

    return null;
  }

  HashMap<int, int> _sortArgs<M extends Mapper>(
    M mapper,
    List<Type> neededFromTypes,
  ) {
    final fromTypes = List.from(neededFromTypes);
    final args = HashMap<int, int>();

    for (var i = 0; i < mapper.fromTypes.length; i++) {
      final type = mapper.fromTypes[i];

      final index = fromTypes.indexWhere((e) => e == type);

      fromTypes.removeAt(index);
      args[i] = index;
    }

    return args;
  }
}
