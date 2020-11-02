import 'package:flutter/material.dart';
import 'package:food_app_ui/models/models.dart';
import 'package:food_app_ui/widgets/contact_button.dart';
import 'package:food_app_ui/widgets/food_menu.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({Key key, this.restaurant}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  IconData displayIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.restaurant.imageUrl,
                  child: Image(
                    image: AssetImage(widget.restaurant.imageUrl),
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          iconSize: 30.0,
                        ),
                        IconButton(
                          icon: Icon(displayIcon,
                              color: displayIcon == Icons.favorite_border
                                  ? Colors.white
                                  : Colors.red),
                          onPressed: () {
                            setState(() {
                              displayIcon == Icons.favorite_border
                                  ? displayIcon = Icons.favorite
                                  : displayIcon = Icons.favorite_border;
                            });
                          },
                          iconSize: 30.0,
                        )
                      ],
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.restaurant.name,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '0.2 miles away',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < widget.restaurant.rating; i++)
                        Text(
                          '⭐',
                          style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 2,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.restaurant.address,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrangeButton(text: 'Reviews'),
                  OrangeButton(text: 'Contact'),
                ],
              ),
            ),
            FoodMenu(restaurant: widget.restaurant),
          ],
        ),
      ),
    );
  }
}
