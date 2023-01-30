import 'mapper.dart';

/// [Mapper] with 1 source object.
abstract class OneSourceMapper<FROM extends Object, TO extends Object>
    implements Mapper {
  const OneSourceMapper();

  TO map(FROM object);

  @override
  Type get toType => TO;

  @override
  List<Type> get fromTypes => [
        FROM,
      ];
}
