import 'package:campus_way_app/pages/tabs/homeScreen.dart';
import 'package:campus_way_app/pages/tabs/profileScreen.dart';
import 'package:campus_way_app/pages/tabs/searchScreen.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    profileScreen(),
  ];

  void _onItemSelected(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeBorder = Border.all(
      color: AppColors.white,
      width: 1.0,
    );

    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.normal_green,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0))
        ),
        height: AppConstants.screenHeight(context)/11.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,
          vertical: 7),
          child: GNav(
            backgroundColor: AppColors.normal_green,
            gap: 7,
            tabActiveBorder: activeBorder,
            selectedIndex: selectedIndex,
            onTabChange: _onItemSelected,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                iconActiveColor: AppColors.white,
                iconColor: AppColors.white,
                text: 'Home',
                textStyle: AppTextStyles.navText,
              ),
              GButton(
                icon: Icons.search_outlined,
                iconActiveColor: AppColors.white,
                iconColor: AppColors.white,
                text: 'Search',
                textStyle: AppTextStyles.navText,
              ),
              GButton(
                icon: Icons.account_circle_outlined,
                iconActiveColor: AppColors.white,
                iconColor: AppColors.white,
                text: 'Profile',
                textStyle: AppTextStyles.navText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
