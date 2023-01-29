import '../../mappers/mappers.dart';

class MapperNotRegistered<T extends Mapper> implements Exception {
  @override
  String toString() => '$T is not registered';
}
