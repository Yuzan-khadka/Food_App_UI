import 'package:flutter/material.dart';
import 'package:food_app_ui/data/data.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart' + ' (${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemCount: currentUser.cart.length,
            itemBuilder: (context, index) {
              final cartItem = currentUser.cart[index];

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 120.0,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: AssetImage(cartItem.food.imageUrl),
                              height: 120.0,
                              width: 140.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.food.name,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      cartItem.restaurant.name,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (cartItem.quantity == 0) {
                                                  return null;
                                                }

                                                setState(() {
                                                  cartItem.quantity--;
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 14.0,
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Text(
                                              '${cartItem.quantity}',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  cartItem.quantity++;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 14.0,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '\$${cartItem.food.price}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 1.0,
                color: Colors.grey,
              );
            }),
      ),
    );
  }
}
