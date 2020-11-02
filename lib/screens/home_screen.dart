import 'package:flutter/material.dart';
import 'package:food_app_ui/data/data.dart';
import 'package:food_app_ui/screens/cart_screen.dart';
import 'package:food_app_ui/widgets/recent_orders.dart';
import 'package:food_app_ui/widgets/restaurant_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
        ),
        title: Text('Food Delivery'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.add_shopping_cart,
                  size: 30.0,
                  color: Colors.white,
                ),
                Text(
                  '(${currentUser.cart.length})',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  hintText: 'Search Food or Restaurants',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        BorderSide(width: 0.8, color: Colors.deepOrangeAccent),
                  )),
            ),
          ),
          RecentOrder(),
          RestaurantList(),
        ],
      ),
    );
  }
}
