import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  OrangeButton({this.text});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
