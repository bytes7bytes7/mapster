import '../mapper_meta.dart';

class MapperCreatorNotRegistered<T extends MapperCreator> implements Exception {
  @override
  String toString() => '$T is not registered';
}
