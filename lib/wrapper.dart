import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logzee/log_reg_toggle.dart';
import 'package:logzee/screens/home_screen.dart';
import 'package:logzee/screens/verify_email_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            User? user = snapshot.data;
            print(user);
            if (user != null && !user.emailVerified) {
              return const VerifyEmailScreen();
            } else {
              return HomeScreen();
            }
          } else {
            return const LogOrRegScreen();
          }
        },
      ),
    );
  }
}
