import 'mapper.dart';

/// [Mapper] with 3 source objects.
abstract class ThreeSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    FROM3 extends Object, TO extends Object> extends Mapper<TO> {
  const ThreeSourcesMapper();

  TO map(FROM1 object1, FROM2 object2, FROM3 object3);

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
      ];
}
