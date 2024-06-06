import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/styles.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:campus_way_app/widgets/features/exploreCampusDisplayWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class exploreCampusPage extends StatefulWidget {
  final int selectedCategory;

  exploreCampusPage({required this.selectedCategory});
  @override
  State<exploreCampusPage> createState() => _exploreCampusState();
}

class _exploreCampusState extends State<exploreCampusPage> {
  late int selectedCategory;
  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Container(
          margin: EdgeInsets.fromLTRB(AppConstants.screenWidth(context) / 15, 10, AppConstants.screenWidth(context) / 15, 0),
          child: Column(
            children: [
              SizedBox(
                height: AppConstants.screenHeight(context) / 3.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    exploreTopBar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 1;
                            });
                          },
                          child: CategoryContainer(
                            category: Text('Food Courts'),
                            icon: (selectedCategory == 1 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_foodcourts_dark.png') 
                                : AssetImage('assets/category_icons/cic_foodcourts_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 2;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Buildings'),
                            icon: (selectedCategory == 2 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_buildings_dark.png')
                                : AssetImage('assets/category_icons/cic_buildings_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 3;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Games'),
                            icon: (selectedCategory == 3 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_games_dark.png')
                                : AssetImage('assets/category_icons/cic_games_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 4;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Libraries'),
                            icon: (selectedCategory == 4 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_libraries_dark.png')
                                : AssetImage('assets/category_icons/cic_libraries_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 5;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Hostels'),
                            icon: (selectedCategory == 5 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_hostels_dark.png')
                                : AssetImage('assets/category_icons/cic_hostels_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 6;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Temple'),
                            icon: (selectedCategory == 6 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_temple_dark.png')
                                : AssetImage('assets/category_icons/cic_temple_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 7;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Admin Cell'),
                            icon: (selectedCategory == 7 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_admincell_dark.png')
                                : AssetImage('assets/category_icons/cic_admincell_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = 8;
                            });
                          },
                          child: CategoryContainer(
                            category: const Text('Others'),
                            icon: (selectedCategory == 8 || selectedCategory == 0)
                                ? AssetImage('assets/category_icons/cic_others_dark.png')
                                : AssetImage('assets/category_icons/cic_others_light.png'),
                            color: AppColors.normal_green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: (selectedCategory != 0)
                    ? ExploreCampusDisplayWidget(typeId: selectedCategory)
                    : noCategorySelected(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class exploreTopBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: AppColors.normal_black,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          height: AppConstants.screenHeight(context)/30,
          child: AutoSizeText(
            'Explore Campus With Us',
            style: AppTextStyles.semiBold,
            maxFontSize: 24,
            minFontSize: 19,
          ),
        ),
      ],
    );
  }
}

class noCategorySelected extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.screenHeight(context)/1.8,
      width: AppConstants.screenWidth(context)/2,
      child: Center(child: Image.asset('assets/images/no_Selection.png')),
    );
  }
}