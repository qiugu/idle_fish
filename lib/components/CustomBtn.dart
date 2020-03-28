import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final String text;
  final Function onPressed;

  CustomBtn({
    this.width = 150,
    this.height = 50,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.text, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: RaisedButton(
        child: Text(this.text),
        color: this.color,
        textColor: this.textColor,
        onPressed: this.onPressed,
      ),
    );
  }
}
