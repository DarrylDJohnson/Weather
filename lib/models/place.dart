/// A class for holding a place.

class Place {
  final String name;
  final double lat;
  final double lng;
  final String description;

  Place({
    this.name,
    this.lat,
    this.lng,
    this.description,
  });

  Place.fromJson(Map<String, dynamic> map)
      : this.name = map['name'],
        this.lat = map['lat'],
        this.lng = map['lng'],
        this.description = map['description'];

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'lat': this.lat,
        'lng': this.lng,
        'description': this.description
      };

  bool isValid() =>
      this?.name != null && this?.lat != null && this?.lng != null;
}
