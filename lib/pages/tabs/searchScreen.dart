import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';

class SearchScreen extends StatefulWidget{
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen',
      style: AppTextStyles.semiBold,),
    );
  }
}