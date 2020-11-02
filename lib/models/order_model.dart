import 'package:food_app_ui/models/food_model.dart';
import 'package:food_app_ui/models/restaurant_model.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
   int quantity;

  Order({
    this.date,
    this.restaurant,
    this.food,
    this.quantity,
  });
}
