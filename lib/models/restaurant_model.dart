import 'package:food_app_ui/models/food_model.dart';

class Restaurant {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<Food> menu;

  Restaurant({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
  });
}