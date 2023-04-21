// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

/// Helps to specify output type.
class To<T> {
  final Type to = T;

  @override
  int get hashCode => to.hashCode;

  @override
  bool operator ==(covariant To other) =>
      identical(this, other) || to == other.to;
}
