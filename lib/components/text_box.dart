import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  const MyTextBox({
    super.key,
    required this.sectionName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //section name
          Text(
            sectionName,
          ),

          //text
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
