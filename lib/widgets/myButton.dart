import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        color: Colors.blueGrey,
        width: double.infinity,
        child: Text(text),
      ),
    );
  }
}
