import 'mapper.dart';

/// [Mapper] with 1 source object.
abstract class OneSourceMapper<FROM extends Object, TO extends Object>
    extends Mapper<TO> {
  const OneSourceMapper();

  TO map(FROM object);

  @override
  List<Type> get fromTypes => [
        FROM,
      ];
}
