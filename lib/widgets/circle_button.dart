import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const CircleButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Card(
          elevation: 1.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            icon,
            color: kGrey2,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}
