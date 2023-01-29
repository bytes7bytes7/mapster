import 'mapper.dart';

abstract class SixSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>
    implements Mapper {
  const SixSourcesMapper();

  TO map(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
  );
}
