import 'mapper.dart';

/// [Mapper] with 2 source objects.
abstract class TwoSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    TO extends Object> implements Mapper {
  const TwoSourcesMapper();

  TO map(FROM1 object1, FROM2 object2);

  @override
  Type get toType => TO;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
      ];
}
