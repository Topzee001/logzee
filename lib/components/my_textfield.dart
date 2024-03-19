import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  //final controller;
  final String labelText;
  final bool obscureText;
  final controller;
  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
         controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey.shade500)
            // border: OutlineInputBorder(),
            //contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
      ),
    );
  }
}
