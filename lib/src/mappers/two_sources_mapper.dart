import 'mapper.dart';

/// [Mapper] with 2 source objects.
abstract class TwoSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    TO extends Object> extends Mapper<TO> {
  TwoSourcesMapper(super.input)
      : source1 = getSource(input: input, type: FROM1, order: 1),
        source2 = getSource(input: input, type: FROM2, order: 2);

  final FROM1 source1;
  final FROM2 source2;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
      ];
}
