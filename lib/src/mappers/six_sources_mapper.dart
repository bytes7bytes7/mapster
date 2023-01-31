import 'mapper.dart';

/// [Mapper] with 6 source objects.
abstract class SixSourcesMapper<
    FROM1 extends Object,
    FROM2 extends Object,
    FROM3 extends Object,
    FROM4 extends Object,
    FROM5 extends Object,
    FROM6 extends Object,
    TO extends Object> extends Mapper<TO> {
  SixSourcesMapper(super.input)
      : source1 = getSource(input: input, type: FROM1, order: 1),
        source2 = getSource(input: input, type: FROM2, order: 2),
        source3 = getSource(input: input, type: FROM3, order: 3),
        source4 = getSource(input: input, type: FROM4, order: 4),
        source5 = getSource(input: input, type: FROM5, order: 5),
        source6 = getSource(input: input, type: FROM6, order: 6);

  final FROM1 source1;
  final FROM2 source2;
  final FROM3 source3;
  final FROM4 source4;
  final FROM5 source5;
  final FROM6 source6;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
      ];
}
