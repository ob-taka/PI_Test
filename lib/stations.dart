import 'dart:convert';

import 'package:flutter/services.dart';

class Stations {
  String keyword;
  String autocomplete;
  String line;
  double lat;
  double long;

  Stations({
    this.keyword,
    this.autocomplete,
    this.line,
    this.lat,
    this.long
  });

  factory Stations.fromJson(Map<String, dynamic> parsedJson) {
    return Stations(
        keyword: parsedJson['keyword'] as String,
        autocomplete: parsedJson['autocompleteTerm'] as String,
        line: parsedJson['line'] as String,
        lat: parsedJson['lat'] as double,
        long: parsedJson['long'] as double
    );
  }
}

class StationViewModel {
  static List<Stations> stations;

  static Future loadStations() async {
    try {
      stations = new List<Stations>();
      String jsonString = await rootBundle.loadString('assets/station.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['stations'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        stations.add(new Stations.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
    print(stations);
  }
}
