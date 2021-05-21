import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validation;
  final bool obscureText;
  PasswordTextFormField({
    Key? key,
    required this.hintText,
    required this.validation,
    required this.obscureText,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              // obscureText = !obscureText;
            });
            FocusScope.of(context).unfocus();
          },
          child: Icon(widget.obscureText == true
              ? Icons.visibility
              : Icons.visibility_off),
        ),
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      validator: widget.validation,
    );
  }
}
