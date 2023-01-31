import 'package:meta/meta.dart';

/// Helps to specify output type.
@immutable
class To<T extends Object> {
  final Type to = T;

  @override
  int get hashCode => to.hashCode;

  @override
  bool operator ==(covariant To other) =>
      identical(this, other) || other.to == other.to;
}
