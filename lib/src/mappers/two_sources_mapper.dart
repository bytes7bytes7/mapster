import 'mapper.dart';

/// [Mapper] with 2 source objects.
abstract class TwoSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    TO extends Object> extends Mapper<TO> {
  const TwoSourcesMapper();

  TO map(FROM1 object1, FROM2 object2);

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
      ];
}
