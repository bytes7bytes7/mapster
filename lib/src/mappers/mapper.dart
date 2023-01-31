// ignore_for_file: avoid_unused_constructor_parameters

import 'dart:collection';

import 'to.dart';

String sourceKey(Type type, {int order = 1}) => '$type $order';

T getSource<T extends Object>({
  required HashMap<String, Object> input,
  required Type type,
  required int order,
}) {
  var i = order;
  late String key;

  do {
    key = sourceKey(type, order: i);
    i--;
  } while (!input.containsKey(key));

  return input[key] as T;
}

/// Base class for all mappers.
abstract class Mapper<TO extends Object> {
  const Mapper(HashMap<String, Object> input);

  TO map();

  /// Types of source objects.
  List<Type> get fromTypes;

  /// Helps to define output type.
  To<TO> get to => To<TO>();
}
