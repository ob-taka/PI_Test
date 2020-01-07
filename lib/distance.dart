import 'package:flutter/material.dart';
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
        child: Text(cal_distance(userLocation.latitude, userLocation.longitude, StationViewModel.stations[fetchindex(destination)].lat, StationViewModel.stations[fetchindex(destination)].long)),
      ),
    );
  }
}

int fetchindex(x) {
  int index = StationViewModel.stations.indexOf(x);
  return index;
}

String cal_distance(sLat, sLong, dLat, dLong) {
  double distance = acos(sin(pi * sLat / 180.0) * sin(pi * dLat / 180.0) +
          cos(pi * sLat / 180.0) *
              cos(pi * dLat / 180.0) *
              cos(pi * sLong / 180.0 - pi * dLong / 180.0)) *
      6378; //km
  if (distance <= 0.5) {
    return 'please alight at the next stop';
  } else {
    return 'not there yet';
  }
}