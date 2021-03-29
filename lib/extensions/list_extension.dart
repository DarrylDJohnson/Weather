extension ListE<E> on List<E> {
  /// Compares elements of a List
  /// Returns the best fitting element
  E compare(bool compare(E element, E result)) {
    E result = this.first;

    this.forEach((element) {
      if (compare(element, result)) {
        result = element;
      }
    });

    return result;
  }
}

extension ListExtension on List {
  /// Determines the most common attribute of elements in a list
  /// Returns the most common attribute of unknown type
  dynamic mostCommonAttribute<E>(dynamic attribute(E element)) {
    Map<dynamic, int> map = {};

    this.forEach((element) {
      map.putIfAbsent(attribute(element), () => 0);
      map.update(attribute(element), (value) => value + 1);
    });

    MapEntry<dynamic, int> result = map.entries.first;

    map.entries.forEach((entry) {
      if (entry.value > result.value) result = entry;
    });

    return result.key;
  }

  /// Casts a list of elements to type T
  List<T> convert<T>(T Function(dynamic) converter) {
    List<T> list = [];

    this.forEach((element) => list.add(converter(element)));

    return list;
  }
}

extension ListDynamicExtension on dynamic {
  /// Combines two lists with elements made unique by an identifier
  /// Returns a List
  List distinctJoin(List other, Function(dynamic) identifier) {
    Map map = {};

    if (this != null && this is List) {
      this.forEach(
          (element) => map.putIfAbsent(identifier(element), () => element));
    }

    if (other != null && other is List)
      other.forEach(
          (element) => map.putIfAbsent(identifier(element), () => element));

    return map.values.toList();
  }
}
