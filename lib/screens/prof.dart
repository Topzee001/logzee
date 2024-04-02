// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({super.key});

//   final user = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Profile page'),
//       ),
//       body: ListView(
//         children: const [
//           SizedBox(
//             height: 50,
//           ),

//           //profile pic
//           Icon(
//             Icons.person,
//             size: 72,
//           ),

//           //user email
//           Center(
//             child: Text(
//               "Welcome you're logged in as: ${user?.email ?? 'Guest'}",
//               style: const TextStyle(color: Colors.black),
//             ),
//           ),

//           //user details
//         ],
//       ),
//     );
//   }
// }
