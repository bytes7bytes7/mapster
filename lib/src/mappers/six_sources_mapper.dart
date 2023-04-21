import 'mapper.dart';

/// [Mapper] with 6 source objects.
abstract class SixSourcesMapper<FROM1, FROM2, FROM3, FROM4, FROM5, FROM6, TO>
    extends Mapper<TO> {
  SixSourcesMapper(super.input)
      : source1 = getMapperSourceByType<FROM1>(input),
        source2 = getMapperSourceByType<FROM2>(input),
        source3 = getMapperSourceByType<FROM3>(input),
        source4 = getMapperSourceByType<FROM4>(input),
        source5 = getMapperSourceByType<FROM5>(input),
        source6 = getMapperSourceByType<FROM6>(input);

  final FROM1 source1;
  final FROM2 source2;
  final FROM3 source3;
  final FROM4 source4;
  final FROM5 source5;
  final FROM6 source6;
}
