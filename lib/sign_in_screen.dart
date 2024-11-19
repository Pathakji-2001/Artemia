import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'home_screen.dart'; // Import your home screen

class SignInScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  void _signInWithGoogle(BuildContext context) async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In failed. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signInWithGoogle(context),
          child: Text("Sign In with Google"),
        ),
      ),
    );
  }
}
