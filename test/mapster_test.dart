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

class MockCAndAToDMapper extends Mock implements TwoSourcesMapper<C, A, D> {}

void main() {
  late Mapster mapster;
  late OneSourceMapper<A, B> aToBMapper;
  late OneSourceMapper<B, A> bToAMapper;
  late OneSourceMapper<A, E> aToEMapper;
  late OneSourceMapper<E, B> eToBMapper;
  late OneSourceMapper<A, B> anotherAToBMapper;
  late TwoSourcesMapper<A, C, D> aAndCToDMapper;
  late TwoSourcesMapper<C, A, D> cAndAToDMapper;
  const stubB = B('1');
  const anotherStubB = B('2');
  const stubD = D(1, 'name');
  const anotherStubD = D(2, 'name2');

  setUpAll(() {
    registerFallbackValue(A(1));
    registerFallbackValue(C('name'));
  });

  setUp(() {
    mapster = Mapster();
    aToBMapper = MockAToBMapper();
    bToAMapper = MockBToAMapper();
    aToEMapper = MockAToEMapper();
    eToBMapper = MockEToBMapper();
    anotherAToBMapper = MockAnotherAToBMapper();
    aAndCToDMapper = MockAAndCToDMapper();
    cAndAToDMapper = MockCAndAToDMapper();
  });

  test(
    'Mapster throws when there is no proper registered Mapper.',
    () {
      const a = A(1);

      expect(
        () => mapster.map(a, To<B>()),
        throwsA(
          TypeMatcher<
              MapperCreatorNotRegistered<
                  MapperCreator<OneSourceMapper<A, B>>>>(),
        ),
      );
    },
  );

  test(
    'Mapster does NOT throw when proper Mapper is registered.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster.register(MapperMeta.one((_) => aToBMapper));

      expect(
        () => mapster.map(a, To<B>()),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster throws when some Mappers are registered, '
    'but the proper one is not.',
    () {
      const a = A(1);
      mapster.register(MapperMeta.two((_) => aAndCToDMapper));

      expect(
        () => mapster.map(a, To<B>()),
        throwsA(
          TypeMatcher<
              MapperCreatorNotRegistered<
                  MapperCreator<OneSourceMapper<A, B>>>>(),
        ),
      );
    },
  );

  test(
    'Mapster does NOT throw when some Mappers are registered, '
    'and the proper one is too.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.one((_) => aToBMapper),
        )
        ..register(
          MapperMeta.two((_) => aAndCToDMapper),
        );

      expect(
        () => mapster.map(a, To<B>()),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster maps one object to another.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster.register(MapperMeta.one((_) => aToBMapper));

      final result = mapster.map(a, To<B>());

      expect(
        result,
        stubB,
      );
    },
  );

  test(
    'Mapster finds a proper Mapper and maps one object to another.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.two((_) => aAndCToDMapper),
        )
        ..register(
          MapperMeta.one((_) => aToBMapper),
        );

      final result = mapster.map(a, To<B>());

      expect(
        result,
        stubB,
      );
    },
  );

  test(
    'Mapster finds a proper Mapper and maps one object to another.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.two((_) => aAndCToDMapper),
        )
        ..register(
          MapperMeta.one((_) => aToBMapper),
        );

      final result = mapster.map(a, To<B>());

      expect(
        result,
        stubB,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of I/O types as different'
    'mappers, because input types set of 1st Mapper is not equal to '
    'input types set of 2nd Mapper and also output type of 1st Mapper is not equal '
    'to output type of 2nd Mapper.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.one((_) => aToBMapper),
        )
        ..register(
          MapperMeta.one((_) => bToAMapper),
        );

      expect(
        () => mapster.map(a, To<B>()),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of input types, but '
    'different output type as different mappers.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.one((_) => aToBMapper),
        )
        ..register(
          MapperMeta.one((_) => aToEMapper),
        );

      expect(
        () => mapster.map(a, To<B>()),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same output type, but '
    'different input types as different mappers.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.one((_) => aToBMapper),
        )
        ..register(
          MapperMeta.one((_) => eToBMapper),
        );

      expect(
        () => mapster.map(a, To<B>()),
        returnsNormally,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of input types, and '
    'the same output type as interchangeable mappers.',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);
      when(() => anotherAToBMapper.map()).thenReturn(anotherStubB);

      const a = A(1);
      mapster
        ..register(
          MapperMeta.one((_) => aToBMapper),
        )
        ..register(
          MapperMeta.one((_) => anotherAToBMapper),
        );

      final result = mapster.map(a, To<B>());

      expect(
        result,
        anotherStubB,
      );
    },
  );

  test(
    'Mapster identifies mappers with the same set of input types '
    '(multiple input types in different order), and '
    'the same output type as interchangeable mappers.',
    () {
      when(() => aAndCToDMapper.map()).thenReturn(stubD);
      when(() => cAndAToDMapper.map()).thenReturn(anotherStubD);

      const a = A(1);
      const c = C('name');
      mapster
        ..register(
          MapperMeta.two((_) => aAndCToDMapper),
        )
        ..register(
          MapperMeta.two((_) => cAndAToDMapper),
        );

      final result = mapster.map2(a, c, To<D>());

      expect(
        result,
        anotherStubD,
      );
    },
  );

  test(
    'Map functions of Mapster work well without assignment to a variable',
    () {
      when(() => aToBMapper.map()).thenReturn(stubB);

      const a = A(1);
      mapster.register(MapperMeta.one((_) => aToBMapper));

      expect(
        mapster.map(a, To<B>()),
        stubB,
      );
    },
  );
}
