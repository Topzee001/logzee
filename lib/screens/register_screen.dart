import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logzee/components/my_button.dart';
import 'package:logzee/components/my_textfield.dart';
import 'package:logzee/components/square_tile.dart';
//import 'package:logzee/screens/verify_email_screen.dart';
import 'package:logzee/services/auth_service.dart';
import 'package:logzee/wrapper.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterScreen({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> signUserUp() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }));
    try {
      if (passwordController.text == confirmPasswordController.text) {
        //final userCredential =
        await AuthService().registerUser(
          email: emailController.text,
          password: passwordController.text,
        );
        if (FirebaseAuth.instance.currentUser != null) {
          // Send email verification
          try {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Verification email sent to ${user?.email}'),
              ),
            );
          } catch (e) {
            Navigator.pop(context);
            invalidCredentials(e.toString());
            return; // Stop execution if email verification fails
          }

          Navigator.pop(context);

          print('Register success');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Wrapper()), // Navigate to the Wrapper screen
          );
        } else {
          Navigator.pop(context);
          invalidCredentials('User registration failed');
        }
      } else {
        Navigator.pop(context);
        invalidCredentials('Password does not match');
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print('Error code: ${e.code}');
      print('Error message: ${e.message}');
      invalidCredentials(e.code);
      // Handle specific FirebaseAuthException codes as needed
    }
  }

  void invalidCredentials(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(child: Text(message)),
            //content: const Text('wrong email or password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: const Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: const Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        leading: Container(
          height: 0,
          width: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),

                MyTextField(
                  controller: emailController,
                  labelText: 'Email address',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: 'Register',
                  onTap: signUserUp,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //google button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        imagePath: 'images/google.png',
                        onTap: () {
                          AuthService().signInWithGoogle(context);
                        }),
                    // SizedBox(width: 10),
                    // SquareTile(imagePath: 'images/apple.png'),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already registered?",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        ' Login now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
