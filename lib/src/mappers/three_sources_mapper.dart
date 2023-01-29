import 'mapper.dart';

/// [Mapper] with 3 source objects.
abstract class ThreeSourcesMapper<FROM1, FROM2, FROM3, TO> implements Mapper {
  const ThreeSourcesMapper();

  TO map(FROM1 object1, FROM2 object2, FROM3 object3);

  @override
  Type get toType => TO;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
      ];
}
