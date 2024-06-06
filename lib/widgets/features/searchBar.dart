import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/services/functions/functions.dart';
import 'package:campus_way_app/services/models/Location.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:flutter/material.dart';

class searchBar extends StatefulWidget {
  final Function(
          String name, double latitude, double longitude, bool locationSearched)
      onSearch; // Callback to send search results
  searchBar({required this.onSearch, super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  String searchName = '';
  double searchLongitude = 0;
  double searchLatitude = 0;
  String searchDisplayText = 'Search your destination';
  bool locationSearched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          AppConstants.screenWidth(context) / 19,
          AppConstants.screenHeight(context) / 32,
          AppConstants.screenWidth(context) / 19,
          0),
      child: Container(
        height: AppConstants.screenHeight(context) / 18,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius:
              BorderRadius.circular(AppConstants.screenHeight(context) / 36),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.25), // Shadow color with opacity
            blurRadius: 8.0, // Softens the shadow
            spreadRadius: 1.5, // Extends the shadow
            offset: Offset(4, 4), // Changes position of the shadow
          ),],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(AppConstants.screenWidth(context) / 22,
              0, AppConstants.screenWidth(context) / 37, 0),
          child: InkWell(
            onTap: () {
              showSearch(
                context: context,
                delegate: LocationSearchDelegate(searchLocations),
              ).then((selectedLocation) {
                if (selectedLocation != null) {
                  searchName = selectedLocation.name;
                  searchLongitude = selectedLocation.longitude;
                  searchLatitude = selectedLocation.latitude;
                  locationSearched = true;
                  widget.onSearch(searchName, searchLongitude, searchLatitude,
                      locationSearched);
                  searchDisplayText = searchName;
                }
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: AppConstants.screenHeight(context) / 25,
                  width: AppConstants.screenWidth(context) / 1.7,
                  alignment: AlignmentDirectional.centerStart,
                  child: AutoSizeText(
                    locationSearched
                        ? searchDisplayText
                        : 'Search your destination',
                    minFontSize: 16,
                    maxFontSize: 20,
                    style: AppTextStyles.semiBold.copyWith(
                        color: AppColors.normal_green, letterSpacing: 0),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: locationSearched
                        ? AppColors.white
                        : AppColors.normal_green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: locationSearched
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                locationSearched = false;
                                widget.onSearch(searchName, searchLongitude,
                                    searchLatitude, locationSearched);
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.normal_green,
                            ),
                          )
                        : Icon(
                            Icons.search,
                            color: AppColors.white,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
