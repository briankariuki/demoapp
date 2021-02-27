import 'dart:convert';

import 'package:meta/meta.dart';

class Listing {
  final String title;
  final String description;
  final String location;
  final String price;
  final String imageUrl;
  final String smallDescription;

  Listing({
    @required this.title,
    @required this.description,
    @required this.location,
    @required this.price,
    @required this.imageUrl,
    @required this.smallDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'imageUrl': imageUrl,
      'smallDescription': smallDescription,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Listing(
      title: map['title'],
      description: map['description'],
      location: map['location'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      smallDescription: map['smallDescription'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Listing.fromJson(String source) =>
      Listing.fromMap(json.decode(source));
}
