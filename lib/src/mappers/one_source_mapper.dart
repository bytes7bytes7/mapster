import 'mapper.dart';

abstract class OneSourceMapper<FROM, TO> implements Mapper {
  const OneSourceMapper();

  TO map(FROM object);

  @override
  Type get toType => TO;

  @override
  List<Type> get fromTypes => [
        FROM,
      ];
}
