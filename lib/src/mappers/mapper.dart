// ignore_for_file: avoid_unused_constructor_parameters

import 'dart:collection';

T getMapperSourceByType<T extends Object>(MapperInput input) =>
    (input[T] as List).removeAt(0);

/// Input parameters for [Mapper].
typedef MapperInput = HashMap<Type, List<Object>>;

/// Base class for all mappers.
abstract class Mapper<TO extends Object> {
  const Mapper(MapperInput input);

  /// Mapping method.
  TO map();
}
