import 'mapper.dart';

/// [Mapper] with 1 source object.
abstract class OneSourceMapper<FROM extends Object, TO extends Object>
    extends Mapper<TO> {
  OneSourceMapper(super.input)
      : source = getSource(input: input, type: FROM, order: 1);

  final FROM source;

  @override
  List<Type> get fromTypes => [
        FROM,
      ];
}
