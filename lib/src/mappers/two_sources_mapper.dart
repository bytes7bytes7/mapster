import 'mapper.dart';

/// [Mapper] with 2 source objects.
abstract class TwoSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    TO extends Object> extends Mapper<TO> {
  TwoSourcesMapper(super.input)
      : source1 = getMapperSourceByType<FROM1>(input),
        source2 = getMapperSourceByType<FROM2>(input);

  final FROM1 source1;
  final FROM2 source2;
}
