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
      : source1 = getSource<FROM1>(input),
        source2 = getSource<FROM2>(input),
        source3 = getSource<FROM3>(input),
        source4 = getSource<FROM4>(input),
        source5 = getSource<FROM5>(input),
        source6 = getSource<FROM6>(input);

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
