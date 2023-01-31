import 'mapper.dart';

/// [Mapper] with 8 source objects.
abstract class EightSourcesMapper<
    FROM1 extends Object,
    FROM2 extends Object,
    FROM3 extends Object,
    FROM4 extends Object,
    FROM5 extends Object,
    FROM6 extends Object,
    FROM7 extends Object,
    FROM8 extends Object,
    TO extends Object> extends Mapper<TO> {
  EightSourcesMapper(super.input)
      : source1 = getSource(input: input, type: FROM1, order: 1),
        source2 = getSource(input: input, type: FROM2, order: 2),
        source3 = getSource(input: input, type: FROM3, order: 3),
        source4 = getSource(input: input, type: FROM4, order: 4),
        source5 = getSource(input: input, type: FROM5, order: 5),
        source6 = getSource(input: input, type: FROM6, order: 6),
        source7 = getSource(input: input, type: FROM7, order: 7),
        source8 = getSource(input: input, type: FROM8, order: 8);

  final FROM1 source1;
  final FROM2 source2;
  final FROM3 source3;
  final FROM4 source4;
  final FROM5 source5;
  final FROM6 source6;
  final FROM7 source7;
  final FROM8 source8;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
        FROM4,
        FROM5,
        FROM6,
        FROM7,
        FROM8,
      ];
}
