import 'mappers/mappers.dart';

class Mapster {
  final _mappers = <Mapper>[];

  void register(Mapper mapper) {
    _mappers.add(mapper);
  }

  TO map<FROM, TO>(FROM object) {
    OneSourceMapper? mapper;

    for (final m in _mappers) {
      if (m is OneSourceMapper<FROM, TO>) {
        mapper = m;
        break;
      }
    }

    if (mapper == null) {
      throw Exception('Mapper not found');
    }

    return mapper.map(object);
  }

  TO map2<FROM1, FROM2, TO>(FROM1 object1, FROM2 object2) {
    TwoSourcesMapper<FROM1, FROM2, TO>? mapper1;
    TwoSourcesMapper<FROM2, FROM1, TO>? mapper2;

    for (final m in _mappers) {
      if (m is TwoSourcesMapper<FROM1, FROM2, TO>) {
        mapper1 = m;
        break;
      }

      if (m is TwoSourcesMapper<FROM2, FROM1, TO>) {
        mapper2 = m;
        break;
      }
    }

    if (mapper1 != null) {
      return mapper1.map(object1, object2);
    }

    if (mapper2 != null) {
      return mapper2.map(object2, object1);
    }

    throw Exception('Mapper not found');
  }
}
