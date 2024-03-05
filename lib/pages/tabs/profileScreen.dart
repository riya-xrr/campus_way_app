import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';

class profileScreen extends StatefulWidget{
  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen',
        style: AppTextStyles.semiBold,),
    );
  }
}