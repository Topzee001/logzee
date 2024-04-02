//contains firebase methods for signup signin, and signout

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:logzee/wrapper.dart';
//import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('the sign-in error is ${e.code}');
    } catch (e) {
      // Handle other errors
      print('Error signing in: $e');
    }
  }

  Future<UserCredential> signUserIn({
    required String email,
    required String password,
  }) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('The sign-in error is ${e.code}');
      // Re-throw the FirebaseAuthException to be handled in the calling code
      rethrow;
    } catch (e) {
      // Handle other errors
      print('Error signing in: $e');
      // Re-throw the other errors to be handled in the calling code
      rethrow;
    }
  }

  Future<void> signUserOut() async {
    await auth.signOut();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // Begin auth details from request
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

      // Create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );

      // to sign in

      await FirebaseAuth.instance.signInWithCredential(credential);

      // User signed in successfully, navigate to Wrapper
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Wrapper()),
      );
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  Future<void> handleSignOut() async {
    try {
      // Step 6: Sign out from Google
      await GoogleSignIn().signOut();
      print('Signed out successfully.');
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  Future<void> passwordReset(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
