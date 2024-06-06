import 'package:campus_way_app/auth/landing_page.dart';
import 'package:campus_way_app/pages/tabs/navbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // User is signed in
          return Navbar(selectedIndex: 0,);
        } else {
          // User is not signed in
          return LandingPage();
        }
      },
    );
  }
}
