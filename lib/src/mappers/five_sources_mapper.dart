import 'mapper.dart';

abstract class FiveSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, TO>
    implements Mapper {
  const FiveSourcesMapper();

  TO map(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
  );
}
