import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: user != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL ?? ""),
                    radius: 40,
                  ),
                  SizedBox(height: 20),
                  Text("Hello, ${user.displayName}"),
                  Text("Email: ${user.email}"),
                ],
              )
            : Text("No user logged in"),
      ),
    );
  }
}
