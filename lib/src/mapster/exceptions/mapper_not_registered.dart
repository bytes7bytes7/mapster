class MapperNotRegistered implements Exception {
  const MapperNotRegistered(this.mapperType);

  final Type mapperType;

  @override
  String toString() => '$mapperType is not registered';
}
