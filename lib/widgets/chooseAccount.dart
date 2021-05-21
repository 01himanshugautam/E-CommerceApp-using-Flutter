import 'package:flutter/material.dart';

class ChooseAccount extends StatelessWidget {
  final String text;
  final String urlText;
  final Function() onTap;
  const ChooseAccount({
    Key? key,
    required this.text,
    required this.urlText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            urlText,
            style: TextStyle(
              fontSize: 20,
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
