import 'dart:ui';

import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final redline = [
    "Jurong East",
    "Bukit Batok",
    "Bukit Gombak",
    "Choa Chu Kang",
    "Yew Tee",
    "Kranji",
    "Marsiling",
    "Woodlands",
    "Admiralty",
    "Sembawang",
    "Yishun",
    "Khatib",
    "Yio Chu Kang",
    "Ang Mo Kio",
    "Bishan",
    "Braddell",
    "Toa Payoh",
    "Novena",
    "Newton",
    "Orchard",
    "Somerset",
    "Dhoby Ghaut",
    "City Hall",
    "Raffles Place",
    "Marina Bay",
    "Marian south Pier",
  ];

  final recentSearch = ['no recent Search']; //addtional feature
  var suggestions = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text(suggestions[0]);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestions = query.isEmpty
        ? recentSearch
        : redline.where((x) => x.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.train),
        title: RichText(
          text: TextSpan(
              text: suggestions[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  children: [TextSpan(
                    text: suggestions[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                  )]
                  ),
        ),
      ),
      itemCount: suggestions.length,
    );
  }
  // not functioning suggestion, need firebase
}
