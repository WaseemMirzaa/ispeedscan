import 'package:collection/collection.dart';

enum Themes {
  Standard,
  Aubergine,
  Retro,
  Silver,
  Night,
  Dark,
}

enum Types {
  normal,
  terrain,
  satellite,
  hybrid,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Themes):
      return Themes.values.deserialize(value) as T?;
    case (Types):
      return Types.values.deserialize(value) as T?;
    default:
      return null;
  }
}
