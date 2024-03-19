import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logzee/log_reg_toggle.dart';
import 'package:logzee/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  //final AuthService _authService = AuthService();

  Future<void> signOut(BuildContext context) async {
    await AuthService().signUserOut();
    AuthService().handleSignOut();
    // _authService.handleSignOut();
    //Navigator.pop();
    //Navigator.pushReplacementNamed(context, '/login');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LogOrRegScreen()),
    // );
    print('Signed out successfully.');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogOrRegScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome screen'),
        actions: [
          IconButton(
            onPressed: () => signOut(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome you're logged in as: ${user?.email ?? 'Guest'}",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
