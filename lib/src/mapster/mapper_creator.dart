import '../mappers/mapper.dart';

/// Callback for creating [Mapper].
typedef MapperCreator<M extends Mapper> = M Function(MapperInput input);
