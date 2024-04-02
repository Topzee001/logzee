import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logzee/components/text_box.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  //final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile Screen'),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),

          //profile pic
          const Icon(
            Icons.person,
            size: 72,
          ),
          const SizedBox(
            height: 30,
          ),
          //user email
          Text(
            user?.email ?? 'Guest',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),

//user details
          const Text(
            'My Details',
          ),

          //username
          const MyTextBox(
            sectionName: 'user bio',
            text: 'Ibrahim',
          )
        ],
      ),
    );
  }
}
