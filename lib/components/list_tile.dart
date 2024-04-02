import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  //final IconData? trailingIcon;
  final Widget? trailing;
  const MyListTile({
    super.key,
    required this.onTap,
    required this.title,
    //this.trailingIcon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: trailing,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }
}
