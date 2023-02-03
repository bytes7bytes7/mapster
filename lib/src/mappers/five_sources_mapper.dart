import 'mapper.dart';

/// [Mapper] with 5 source objects.
abstract class FiveSourcesMapper<
    FROM1 extends Object,
    FROM2 extends Object,
    FROM3 extends Object,
    FROM4 extends Object,
    FROM5 extends Object,
    TO extends Object> extends Mapper<TO> {
  FiveSourcesMapper(super.input)
      : source1 = getSource<FROM1>(input),
        source2 = getSource<FROM2>(input),
        source3 = getSource<FROM3>(input),
        source4 = getSource<FROM4>(input),
        source5 = getSource<FROM5>(input);

  final FROM1 source1;
  final FROM2 source2;
  final FROM3 source3;
  final FROM4 source4;
  final FROM5 source5;
}
