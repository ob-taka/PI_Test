import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/data/user_location.dart';
import 'package:test_1/services/location_services.dart';
import 'distance.dart';

class LocationView extends StatelessWidget {

  final String end_station;
  LocationView(this.end_station);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: Center(
        child: MaterialApp(title: 'distance', home: Distance(end_station),)
      )
    );
  }
}



//ACOS(SIN(PI()*[Lat_start]/180.0)*SIN(PI()*[Lat_end]/180.0)+COS(PI()*[Lat_start]/180.0)*COS(PI()*[Lat_end]/180.0)*COS(PI()*[Long_start]/180.0-PI()*[Long_end]/180.0))*6378