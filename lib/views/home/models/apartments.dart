class Apartment {
  final String image;
  final String name;
  final String location;
  final int cost;

  Apartment({
    required this.image,
    required this.name,
    required this.location,
    required this.cost,
  });

  factory Apartment.fromMap(Map<String, dynamic> map) {
    return Apartment(
      image: map['image'],
      name: map['name'],
      location: map['location'],
      cost: map['cost'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'location': location,
      'cost': cost,
    };
  }
}
