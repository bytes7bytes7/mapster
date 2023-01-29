import 'mapper.dart';

abstract class ThreeSourcesMapper<FROM1, FROM2, FROM3, TO> implements Mapper {
  const ThreeSourcesMapper();

  TO map(FROM1 object1, FROM2 object2, FROM3 object3);
}
