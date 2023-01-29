import 'mapper.dart';

abstract class OneSourceMapper<FROM, TO> implements Mapper {
  const OneSourceMapper();

  TO map(FROM object);
}
