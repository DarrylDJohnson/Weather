/// A class for holding a place suggestion.
class Suggestion {
  final String placeId;
  final String description;

  Suggestion(
    this.placeId,
    this.description,
  );

  @override
  String toString() => description;
}
