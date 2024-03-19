import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logzee/log_reg_toggle.dart';
import 'package:logzee/screens/home_screen.dart';
import 'package:logzee/screens/verify_email_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: FirebaseAuth.instance.authStateChanges().first,
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.done:
//             final user = snapshot.data;
//             if (user != null) {
//                if (user.isEmailVerified) {
//               return HomeScreen();
//             }
//                else {
//                 return const VerifyEmailScreen();
//                }
//              }
//             else {
//               //if (user?.emailVerified ?? false) {
//               //return const Text('Done');
//               //} else {
//               //return const VerifyEmailView();
//               //
//               //}
//               return const LogOrRegScreen();
//             }

//           default:
//             return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }

  // return FutureBuilder<User?>(
  //   future: FirebaseAuth.instance.authStateChanges().first,
  //   builder: (context, snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return const CircularProgressIndicator();
  //     } else if (snapshot.hasData && snapshot.data != null) {
  //       User? user = snapshot.data;
  //       print(user);
  //       return HomeScreen();
  //     } else {
  //       return const LogOrRegScreen();
  //     }

  //     // If there's no authenticated user or the email is not verified,
  //     // you may want to redirect to the login or registration screen.
  //   },
  // );
//   }
// }
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
