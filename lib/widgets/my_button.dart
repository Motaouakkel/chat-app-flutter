import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({this.color, this.title, this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200,
            height: 42,
            child: Text(
              title,
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
          )),
    );
  }
}
