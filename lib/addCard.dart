import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
   AddCard(this.hintText,this.icon,this.type,this.action);
  String hintText;
  Icon icon;
  TextInputType type;
  TextInputAction action;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(244, 243, 243, 1)
      ),
     // margin: EdgeInsets.all(25),
      child: Center(
        child: TextField(
          keyboardType:type ,
          textInputAction: action,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: icon,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
              )
          ),
        ),
      ),
    );
  }
}
