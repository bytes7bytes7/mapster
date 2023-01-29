import 'package:mapster/mapster.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class A {
  const A(this.id);

  final int id;
}

class B {
  const B(this.id);

  final String id;
}

class C {
  const C(this.name);

  final String name;
}

class D {
  const D(
    this.id,
    this.name,
  );

  final int id;
  final String name;
}

class E {
  const E(this.id);

  final double id;
}

class MockAToBMapper extends Mock implements OneSourceMapper<A, B> {}

class MockBToAMapper extends Mock implements OneSourceMapper<B, A> {}

class MockAToEMapper extends Mock implements OneSourceMapper<A, E> {}

class MockEToBMapper extends Mock implements OneSourceMapper<E, B> {}

class MockAnotherAToBMapper extends Mock implements OneSourceMapper<A, B> {}

class MockAAndCToDMapper extends Mock implements TwoSourcesMapper<A, C, D> {}

void main() {
  late Mapster mapster;
  late OneSourceMapper<A, B> aToBMapper;
  late OneSourceMapper<B, A> bToAMapper;
  late OneSourceMapper<A, E> aToEMapper;
  late OneSourceMapper<E, B> eToBMapper;
  late OneSourceMapper<A, B> anotherAToBMapper;
  late TwoSourcesMapper<A, C, D> aAndCToDMapper;
  const dummyB = B('1');
  const anotherDummyB = B('2');

  setUpAll(() {
    registerFallbackValue(A(1));
  });

  setUp(() {
    mapster = Mapster();
    aToBMapper = MockAToBMapper();
    bToAMapper = MockBToAMapper();
    aToEMapper = MockAToEMapper();
    eToBMapper = MockEToBMapper();
    anotherAToBMapper = MockAnotherAToBMapper();
    aAndCToDMapper = MockAAndCToDMapper();
  });

  test(
    'Mapster throws when there is no proper registered Mapper.',
    () {
      const a = A(1);

      expect(
        () => mapster.map(a, to<B>),
        throwsA(TypeMatcher<MapperNotRegistered<OneSourceMapper<A, B>>>()),
      );
    },
  );

  test(
    'Mapster does NOT throw when proper Mapper is registered.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);

      const a = A(1);
      mapster.register(aToBMapper);

      expect(
        () => mapster.map(a, to<B>),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster throws when some Mappers are registered, '
    'but the proper one is not.',
    () {
      when(() => aAndCToDMapper.fromTypes).thenReturn([A, C]);
      when(() => aAndCToDMapper.toType).thenReturn(D);

      const a = A(1);
      mapster.register(aAndCToDMapper);

      expect(
        () => mapster.map(a, to<B>),
        throwsA(TypeMatcher<MapperNotRegistered<OneSourceMapper<A, B>>>()),
      );
    },
  );

  test(
    'Mapster does NOT throw when some Mappers are registered, '
    'and the proper one is too.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => aAndCToDMapper.fromTypes).thenReturn([A, C]);
      when(() => aAndCToDMapper.toType).thenReturn(D);

      const a = A(1);
      mapster.registerAll(
        [
          aToBMapper,
          aAndCToDMapper,
        ],
      );

      expect(
        () => mapster.map(a, to<B>),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster maps one object to another.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);

      const a = A(1);
      mapster.register(aToBMapper);

      final result = mapster.map(a, to<B>);

      expect(
        result,
        dummyB,
      );
    },
  );

  test(
    'Mapster finds a proper Mapper and maps one object to another.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => aAndCToDMapper.fromTypes).thenReturn([A, C]);
      when(() => aAndCToDMapper.toType).thenReturn(D);

      const a = A(1);
      mapster.registerAll(
        [
          aAndCToDMapper,
          aToBMapper,
        ],
      );

      final result = mapster.map(a, to<B>);

      expect(
        result,
        dummyB,
      );
    },
  );

  test(
    'Mapster finds a proper Mapper and maps one object to another.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => aAndCToDMapper.fromTypes).thenReturn([A, C]);
      when(() => aAndCToDMapper.toType).thenReturn(D);

      const a = A(1);
      mapster.registerAll(
        [
          aAndCToDMapper,
          aToBMapper,
        ],
      );

      final result = mapster.map(a, to<B>);

      expect(
        result,
        dummyB,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of I/O types as different'
    'mappers, because input types set of 1st Mapper is not equal to '
    'input types set of 2nd Mapper and also output type of 1st Mapper is not equal '
    'to output type of 2nd Mapper.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => bToAMapper.fromTypes).thenReturn([B]);
      when(() => bToAMapper.toType).thenReturn(A);

      const a = A(1);
      mapster.registerAll(
        [
          aToBMapper,
          bToAMapper,
        ],
      );

      expect(
        () => mapster.map(a, to<B>),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of input types, but '
    'different output type as different mappers.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => aToEMapper.fromTypes).thenReturn([A]);
      when(() => aToEMapper.toType).thenReturn(E);

      const a = A(1);
      mapster.registerAll(
        [
          aToBMapper,
          aToEMapper,
        ],
      );

      expect(
        () => mapster.map(a, to<B>),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same output type, but '
    'different input types as different mappers.',
    () {
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => eToBMapper.fromTypes).thenReturn([B]);
      when(() => eToBMapper.toType).thenReturn(E);

      const a = A(1);
      mapster.registerAll(
        [
          aToBMapper,
          eToBMapper,
        ],
      );

      expect(
        () => mapster.map(a, to<B>),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of input types, and '
    'the same output type as interchangeable mappers.',
    () {
      when(() => aToBMapper.fromTypes).thenReturn([A]);
      when(() => aToBMapper.toType).thenReturn(B);
      when(() => aToBMapper.map(any())).thenReturn(dummyB);
      when(() => anotherAToBMapper.fromTypes).thenReturn([A]);
      when(() => anotherAToBMapper.toType).thenReturn(B);
      when(() => anotherAToBMapper.map(any())).thenReturn(anotherDummyB);

      const a = A(1);
      mapster.registerAll(
        [
          aToBMapper,
          anotherAToBMapper,
        ],
      );

      final result = mapster.map(a, to<B>);

      expect(
        result,
        anotherDummyB,
      );
    },
  );
}
