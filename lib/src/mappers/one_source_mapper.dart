import 'mapper.dart';

/// [Mapper] with 1 source object.
abstract class OneSourceMapper<FROM, TO> extends Mapper<TO> {
  OneSourceMapper(super.input) : source = getMapperSourceByType<FROM>(input);

  final FROM source;
}
