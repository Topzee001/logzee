import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String sectionName;
  const MyTextBox({
    super.key,
    required this.sectionName,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 20, bottom: 20),
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //section name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: TextStyle(color: Colors.grey.shade800),
              ),

              //edit button
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey.shade700,
                ),
              )
            ],
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
