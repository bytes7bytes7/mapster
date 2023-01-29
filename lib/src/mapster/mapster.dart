import '../mappers/mapper.dart';

abstract class Mapster {
  void register(Mapper mapper);

  TO map<FROM, TO>(
    FROM object,
  );

  TO map2<FROM1, FROM2, TO>(
    FROM1 object1,
    FROM2 object2,
  );

  TO map3<FROM1, FROM2, FROM3, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
  );

  TO map4<FROM1, FROM2, FROM3, FROM4, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
  );

  TO map5<FROM1, FROM2, FROM3, FROM4, FROM5, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
  );

  TO map6<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
  );

  TO map7<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
  );

  TO map8<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, FROM7, FROM8, TO>(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
    FROM8 object8,
  );

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
  );
}
