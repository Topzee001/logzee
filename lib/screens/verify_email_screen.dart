import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logzee/log_reg_toggle.dart';

class VerifyEmailScreen extends StatefulWidget {
  // final User user;
  const VerifyEmailScreen({
    super.key,
    // required this.user,
  });
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool canResendEmail = false;
  // Future<void> _sendVerificationEmail() async {
  //   //await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  //   final user = FirebaseAuth.instance.currentUser;
  //   await user?.sendEmailVerification();
  // }
  Future<void> _sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        setState(() {
          canResendEmail = false;
        });
        await Future.delayed(const Duration(seconds: 5));
        setState(() {
          canResendEmail = true;
        });
        print('Verification email sent to ${user.email}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Verification email resent to ${user.email}'),
          ),
        );
      } else {
        print('No user signed in');
      }
    } catch (e) {
      print('Error sending verification email: $e');
      //showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: const Text('Email Verification'),
        )),
        leading: Container(
          height: 0,
          width: 0,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("please open email to verify"),
          ),
          const Text("if you haven't recieve an email, press the button below"),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: _sendVerificationEmail,
            child: const Text(
              'Resend email verification',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () {
              // const LogOrRegScreen();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogOrRegScreen()),
              );

              // const return AuthScreen();
              // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
            },
            child: const Text(
              'Verified email? Login now',
            ),
          ),
        ],
      ),
    );
  }
}
