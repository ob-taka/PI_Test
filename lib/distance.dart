import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_1/data/user_location.dart';
import 'dart:math';
import 'package:test_1/stations.dart';

class Distance extends StatelessWidget {
  final String destination;
  Distance(this.destination);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child: Text(
          // '${userLocation.latitude} ${userLocation.longitude}'
          cal_distance(userLocation.latitude, 
          userLocation.longitude, 
          findstation(destination).lat, 
          findstation(destination).long)
          ),
        

        //Text('lat: ${userLocation.latitude} long: ${userLocation.longitude}')
      ),
    );
  }
}

Stations findstation(x){
  Stations result = StationViewModel.stations.firstWhere((item) => item.autocomplete == x);
  return result;
}


String cal_distance(sLat, sLong, dLat, dLong) {
  double distance = acos(sin(pi * sLat / 180.0) * sin(pi * dLat / 180.0) +
          cos(pi * sLat / 180.0) *
              cos(pi * dLat / 180.0) *
              cos(pi * sLong / 180.0 - pi * dLong / 180.0)) *
      6378; //km
  if (distance <= 0.5) {
    return 'please alight at the next stop ${distance}';
  } else {
    return 'not there yet ${distance}';
  }
}