import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validation;
  MyTextFormField({
    Key? key,
    required this.hintText,
    required this.validation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      validator: validation,
    );
  }
}
