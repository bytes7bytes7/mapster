import 'mapper.dart';

/// [Mapper] with 7 source objects.
abstract class SevenSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6,
    FROM7, TO> implements Mapper {
  const SevenSourcesMapper();

  TO map(
    FROM1 object1,
    FROM2 object2,
    FROM3 object3,
    FROM4 object4,
    FROM5 object5,
    FROM6 object6,
    FROM7 object7,
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
        FROM7,
      ];
}
