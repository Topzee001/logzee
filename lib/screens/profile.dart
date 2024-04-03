import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logzee/components/text_box.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  //final AuthService _authService = AuthService();

  Future<void> editField(String field) async {}

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
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: const Text(
              'My Details',
            ),
          ),

          //username
          MyTextBox(
            sectionName: 'Username',
            text: 'Ibrahim',
            onPressed: () {
              editField('username');
            },
          ),
          MyTextBox(
            sectionName: 'bio',
            text: 'No bio yet',
            onPressed: () {
              editField('username');
            },
          ),

          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: const Text(
              'My post',
            ),
          ),
        ],
      ),
    );
  }
}
