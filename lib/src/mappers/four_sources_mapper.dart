import 'mapper.dart';

/// [Mapper] with 4 source objects.
abstract class FourSourcesMapper<FROM1, FROM2, FROM3, FROM4, TO>
    extends Mapper<TO> {
  FourSourcesMapper(super.input)
      : source1 = getMapperSourceByType<FROM1>(input),
        source2 = getMapperSourceByType<FROM2>(input),
        source3 = getMapperSourceByType<FROM3>(input),
        source4 = getMapperSourceByType<FROM4>(input);

  final FROM1 source1;
  final FROM2 source2;
  final FROM3 source3;
  final FROM4 source4;
}
