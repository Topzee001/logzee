import 'package:flutter/material.dart';
import 'package:logzee/screens/login_screen.dart';
import 'package:logzee/screens/register_screen.dart';

class LogOrRegScreen extends StatefulWidget {
  const LogOrRegScreen({Key? key}) : super(key: key);

  @override
  State<LogOrRegScreen> createState() => _LogOrRegScreenState();
}

class _LogOrRegScreenState extends State<LogOrRegScreen> {
  bool _isLoginScreen = true;

  void _togglePage() {
    setState(() {
      _isLoginScreen = !_isLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoginScreen
          ? LoginScreen(onTap: _togglePage) // Corrected here
          : RegisterScreen(onTap: _togglePage),
    );
  }
}
