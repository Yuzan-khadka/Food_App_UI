import 'package:flutter/material.dart';
import 'package:food_app_ui/models/models.dart';

class FoodMenu extends StatelessWidget {
  final Restaurant restaurant;
  FoodMenu({this.restaurant});

  _buildMenuItem(BuildContext context, Food menuItem) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Stack(fit: StackFit.expand, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.multiply),
            child: Image(
              image: AssetImage(menuItem.imageUrl),
              height: 150.0,
              width: 150.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              menuItem.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '\$${menuItem.price}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white),
              iconSize: 25.0,
            ),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        Text('Menu',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemCount: restaurant.menu.length,
              itemBuilder: (context, index) {
                final menuItem = restaurant.menu[index];
                return _buildMenuItem(context, menuItem);
              }),
        )
      ],
    );
  }
}
