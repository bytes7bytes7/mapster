import 'mapper.dart';

/// [Mapper] with 6 source objects.
abstract class SixSourcesMapper<
    FROM1 extends Object,
    FROM2 extends Object,
    FROM3 extends Object,
    FROM4 extends Object,
    FROM5 extends Object,
    FROM6 extends Object,
    TO extends Object> implements Mapper {
  const SixSourcesMapper();

  TO map(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
  );

  @override
  Type get toType => TO;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
      ];
}
