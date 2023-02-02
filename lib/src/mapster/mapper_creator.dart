import '../mappers/mapper.dart';

typedef MapperCreator<M extends Mapper> = M Function(MapperInput input);
