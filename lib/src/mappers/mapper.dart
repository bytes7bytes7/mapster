// ignore_for_file: avoid_unused_constructor_parameters

import 'dart:collection';

import 'to.dart';

T getSource<T extends Object>(MapperInput input) =>
    (input[T] as List<T>).removeAt(0);

/// Input parameters for [Mapper].
typedef MapperInput = HashMap<Type, List<Object>>;

/// Base class for all mappers.
abstract class Mapper<TO extends Object> {
  const Mapper(MapperInput input);

  /// Mapping method.
  TO map();

  /// Types of source objects.
  List<Type> get fromTypes;

  /// Helps to define output type.
  To<TO> get to => To<TO>();
}
