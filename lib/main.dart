import 'package:campus_way_app/auth/SplashScreen.dart';
import 'package:campus_way_app/pages/experiment.dart';
import 'package:campus_way_app/pages/others/popularRoutesPage.dart';
import 'package:campus_way_app/pages/tabs/homeScreen.dart';
import 'package:campus_way_app/pages/tabs/navbar.dart';
import 'package:campus_way_app/pages/tabs/profileScreen.dart';
import 'package:campus_way_app/pages/tabs/searchScreen.dart';
import 'package:campus_way_app/widgets/features/searchCard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'firebase_options.dart';
//https://chatgpt.com/share/eb374e55-6b62-4130-b251-501332c4583b

Future<void> main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Way',
      theme: ThemeData(
        // Define your theme here
      ),
      home: profileScreen(),
    );
  }
}
