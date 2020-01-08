
import 'package:test_1/stations.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:test_1/data/user_location.dart';
import 'package:test_1/services/location_services.dart';
import 'package:test_1/locationView.dart';

class Train extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<Train> {
  AutoCompleteTextField searchField;
  AutoCompleteTextField searchField2;
  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  final startcontroller = TextEditingController();
  final descontroller = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<Stations>> key = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Stations>> key2 = new GlobalKey();
  _AutoCompleteState();

  void _loadData() async {
    await StationViewModel.loadStations();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.black,
                icon: Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: Text("Train", style: new TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SizedBox.expand(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-0.9, -0.7),
                        child: Icon(Icons.radio_button_unchecked),
                      ),
                      Align(
                        alignment: Alignment(-0.9, 0.35),
                        child: Icon(Icons.radio_button_unchecked),
                      ),
                      Align(
                        alignment: Alignment(0.1, -0.95),
                        child: searchField = AutoCompleteTextField<Stations>(
                          style: new TextStyle(
                              color: Colors.black, fontSize: 20.0),
                          decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 5.0, 0.0),
                              filled: true,
                              hintText: 'Choose stating station',
                              hintStyle: TextStyle(color: Colors.grey)),
                          itemSubmitted: (item) {
                            setState(() => searchField
                                .textField.controller.text = item.autocomplete);
                          },
                          clearOnSubmit: false,
                          key: key,
                          suggestions: StationViewModel.stations,
                          itemBuilder: (context, item) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  item.autocomplete,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                ),
                                Text(item.line),
                              ],
                            );
                          },
                          itemSorter: (a, b) {
                            return a.autocomplete.compareTo(b.autocomplete);
                          },
                          itemFilter: (item, query) {
                            return item.autocomplete
                                .toLowerCase()
                                .startsWith(query.toLowerCase());
                          },
                          controller: startcontroller,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0, 0.35),
                        child: searchField2 = AutoCompleteTextField<Stations>(
                          style: new TextStyle(
                              color: Colors.black, fontSize: 20.0),
                          decoration: new InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 5.0, 0.0),
                              filled: true,
                              hintText: 'Choose destination',
                              hintStyle: TextStyle(color: Colors.grey)),
                          itemSubmitted: (item) {
                            setState(() => searchField2.textField.controller.text = item.autocomplete);
                          },
                          clearOnSubmit: false,
                          key: key2,
                          suggestions: StationViewModel.stations,
                          itemBuilder: (context, item) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  item.autocomplete,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                ),
                                Text(item.line),
                              ],
                            );
                          },
                          itemSorter: (a, b) {
                            return a.autocomplete.compareTo(b.autocomplete);
                          },
                          itemFilter: (item, query) {
                            return item.autocomplete
                                .toLowerCase()
                                .startsWith(query.toLowerCase());
                          },
                          controller: descontroller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 15 / 20.5,
                child: ClipRect(
                  child: PhotoView(
                    imageProvider: AssetImage('assets/image/mrt_map2.png'),
                    minScale: PhotoViewComputedScale.contained * 1,
                    maxScale: PhotoViewComputedScale.covered * 4,
                    enableRotation: true,
                    backgroundDecoration:
                        BoxDecoration(color: Theme.of(context).canvasColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text("Submit"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LocationView(descontroller.text)));
            print(descontroller.text);
          },
        ),
      ),
    );
  }
}
