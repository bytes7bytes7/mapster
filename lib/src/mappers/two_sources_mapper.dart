import 'mapper.dart';

/// [Mapper] with 2 source objects.
abstract class TwoSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    TO extends Object> extends Mapper<TO> {
  TwoSourcesMapper(super.input)
      : source1 = getSource<FROM1>(input),
        source2 = getSource<FROM2>(input);

  final FROM1 source1;
  final FROM2 source2;
}
