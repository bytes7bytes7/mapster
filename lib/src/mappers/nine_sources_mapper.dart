import 'mapper.dart';

/// [Mapper] with 9 source objects.
abstract class NineSourcesMapper<
    FROM1 extends Object,
    FROM2 extends Object,
    FROM3 extends Object,
    FROM4 extends Object,
    FROM5 extends Object,
    FROM6 extends Object,
    FROM7 extends Object,
    FROM8 extends Object,
    FROM9 extends Object,
    TO extends Object> implements Mapper<TO> {
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

  @override
  List<Type> get fromTypes => [
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
}
