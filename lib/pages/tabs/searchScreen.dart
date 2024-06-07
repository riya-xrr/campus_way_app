import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_way_app/services/models/campusLocation.dart';
import 'package:campus_way_app/utils/colors.dart';
import 'package:campus_way_app/utils/constants.dart';
import 'package:campus_way_app/utils/textStyles.dart';
import 'package:campus_way_app/widgets/features/searchBar.dart';
import 'package:campus_way_app/widgets/features/searchCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedName = '';
  double searchLongitude = 0;
  double searchLatitude = 0;
  LatLng center = LatLng(22.288853465488614, 73.36456359424861);
  double zoom = 17;
  MapController _mapController = MapController();
  bool destinationSearched = false;

  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 0;
  late final ScrollController scrollController;
  late final PanelController panelController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    panelController = PanelController();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = destinationSearched
        ? AppConstants.screenHeight(context) / 2.5
        : AppConstants.screenHeight(context) / 11.5;
    _panelHeightClosed = destinationSearched
        ? AppConstants.screenHeight(context) / 7
        : 0;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SlidingUpPanel(
              snapPoint: .5,
              disableDraggableOnScrolling: false,
              // footer: Visibility(
              //   visible: !destinationSearched,
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width,
              //     height: AppConstants.screenHeight(context) / 11.5,
              //     child: IgnoreDraggableWidget(
              //         //
              //       child: SizedBox(),
              //     ),
              //   ),
              // ),
              header: Visibility(
                visible: destinationSearched,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ForceDraggableWidget(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: AppConstants.screenWidth(context) / 7,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: AppColors.normal_green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              body: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: center,
                  initialZoom: zoom,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                    'https://api.mapbox.com/styles/v1/riyaxrr/clwsrb7cz01an01qs24ughtxs/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}',
                    additionalOptions: {
                      'accessToken':
                      'pk.eyJ1Ijoicml5YXhyciIsImEiOiJjbHRyYWdqaXEwZDdyMmtuajJyeml2OXZtIn0.76zhTMUfGNJOrQSigoy9zA',
                    },
                  ),
                  Visibility(
                    visible: destinationSearched,
                    child: MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                              searchLatitude + 0.0001, searchLongitude + 0.00025),
                          width: AppConstants.screenWidth(context) / 3,
                          height: AppConstants.screenHeight(context) / 10,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 3.0,
                                    color: AppColors.grey,
                                  ),
                                ],
                                size: AppConstants.screenHeight(context) / 20,
                                color: AppColors.normal_green,
                              ),
                              Expanded(
                                child: AutoSizeText(selectedName,
                                    minFontSize: 15,
                                    maxFontSize: 20,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.semiBold.copyWith(
                                      color: AppColors.normal_green,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0.5, 1.0),
                                          blurRadius: 0.7,
                                          color: AppColors.grey,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              controller: panelController,
              scrollController: scrollController,
              panelBuilder: () {
                return Visibility(
                  visible: destinationSearched,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: FutureBuilder<CampusLocation?>(
                      future: fetchSearchCampusLocation(selectedName),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return Center(child: Text('Location not found'));
                        }
                        return ListView(
                          physics:
                          PanelScrollPhysics(controller: panelController),
                          controller: scrollController,
                          children: <Widget>[
                            SearchCard(
                              locationInfoCard: snapshot.data,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
            ),
            Positioned(
              right: 20.0,
              bottom: _fabHeight + 30,
              child: FloatingActionButton(
                child: Icon(
                  Icons.gps_fixed,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    center = LatLng(22.288853465488614, 73.36456359424861); //user latlong here
                    zoom = 17;
                    _mapController.move(center, zoom);
                  });
                },
                backgroundColor: Colors.white,
              ),
            ),
            searchBar(
              onSearch: (String name, double longitude, double latitude,
                  bool locationSearched) {
                setState(() {
                  selectedName = name;
                  searchLongitude = longitude;
                  searchLatitude = latitude;
                  center = LatLng(searchLatitude, searchLongitude);
                  zoom = 18.0;
                  destinationSearched = locationSearched;
                  if (destinationSearched) {
                    panelController.open(); // Open the panel if destinationSearched is true
                  }
                  else{
                    panelController.close();
                  }
                });
                _mapController.move(center, zoom);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<CampusLocation?> fetchSearchCampusLocation(String locationName) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('exploreCampus')
      .where('name', isEqualTo: locationName)
      .limit(1) // Limit to one result
      .get();
  if (querySnapshot.docs.isNotEmpty) {
    return CampusLocation.fromFirestore(querySnapshot.docs.first);
  }
  return null; // Return null if no document found
}

