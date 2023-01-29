import 'mapper.dart';

abstract class NineSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6,
    FROM7, FROM8, FROM9, TO> implements Mapper {
  const NineSourcesMapper();

  TO map(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
    FROM9 object9,
  );
}
