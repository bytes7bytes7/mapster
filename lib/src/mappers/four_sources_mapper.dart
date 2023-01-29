import 'mapper.dart';

abstract class FourSourcesMapper<FROM1, FROM2, FROM3, FROM4, TO>
    implements Mapper {
  const FourSourcesMapper();

  TO map(FROM1 object1, FROM2 object2, FROM3 object3, FROM4 object4);

  @override
  Type get toType => TO;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
      ];
}
