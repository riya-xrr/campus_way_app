import 'package:campus_way_app/auth/login.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget{
  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async { await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LogIn()),
        );},
        child: Text('Log Out',
          style: AppTextStyles.semiBold,),
      ),
    );
  }
}