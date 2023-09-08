import 'package:contacts/addCard.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(this.txt, this.color);

  String txt;
  Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(160, 50),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 12,
          shadowColor: Colors.black),
      onPressed: () {},
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
