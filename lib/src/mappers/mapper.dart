/// Base class for all mappers.
abstract class Mapper {
  const Mapper();

  /// Type of result object.
  Type get toType;

  /// Types of source objects.
  List<Type> get fromTypes;
}
