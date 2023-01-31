import 'mapper.dart';

/// [Mapper] with 4 source objects.
abstract class FourSourcesMapper<
    FROM1 extends Object,
    FROM2 extends Object,
    FROM3 extends Object,
    FROM4 extends Object,
    TO extends Object> implements Mapper<TO> {
  const FourSourcesMapper();

  TO map(FROM1 object1, FROM2 object2, FROM3 object3, FROM4 object4);

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
      ];
}
