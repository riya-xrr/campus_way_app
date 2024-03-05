import 'package:campus_way_app/firebase_options.dart';
import 'package:campus_way_app/pages/tabs/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  // initializing firebase

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,).then(
  //         (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );

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

      ),
      home: const Navbar(),
    );
  }
}