import 'mapper.dart';

abstract class TwoSourcesMapper<FROM1, FROM2, TO> implements Mapper {
  const TwoSourcesMapper();

  TO map(FROM1 object1, FROM2 object2);
}
