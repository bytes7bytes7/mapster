import 'mapper.dart';

/// [Mapper] with 3 source objects.
abstract class ThreeSourcesMapper<FROM1 extends Object, FROM2 extends Object,
    FROM3 extends Object, TO extends Object> extends Mapper<TO> {
  ThreeSourcesMapper(super.input)
      : source1 = getSource<FROM1>(input),
        source2 = getSource<FROM2>(input),
        source3 = getSource<FROM3>(input);

  final FROM1 source1;
  final FROM2 source2;
  final FROM3 source3;

  @override
  List<Type> get fromTypes => [
        FROM1,
        FROM2,
        FROM3,
      ];
}
