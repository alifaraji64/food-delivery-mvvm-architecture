import 'package:flutter/material.dart';

class Food {
  final String name, category, image, rating, price;
  Food(
      {@required this.name,
      @required this.category,
      @required this.image,
      @required this.rating,
      @required this.price});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'category': this.category,
      'image': this.image,
      'rating': this.rating,
      'pizza': this.price
    };
  }
}
