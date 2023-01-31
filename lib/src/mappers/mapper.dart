import 'to.dart';

/// Base class for all mappers.
abstract class Mapper<TO extends Object> {
  const Mapper();

  /// Types of source objects.
  List<Type> get fromTypes;

  /// Helps to define output type.
  To<TO> get toCreator => To<TO>();
}
