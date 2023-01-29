import 'package:mapster/mapster.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

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

void main() {
  late Mapster mapster;

  setUp(() {
    mapster = Mapster();
  });

  test(
    'Mapster throws when there is no proper registered Mapper',
    () {
      const a = A(1);

      expect(
        () => mapster.map(a, to<B>),
        throwsA(TypeMatcher<MapperNotRegistered>()),
      );
    },
  );
}
