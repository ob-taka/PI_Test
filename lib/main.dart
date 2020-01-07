
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'tile.dart';
import 'train.dart';

void main(){
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
            child: new SizedBox(
              height: 265.0,
                child: StaggeredGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  children: <Widget>[
                    myItems(Icons.account_circle,"user name",0xFF64B5F6),
                    myItems(Icons.credit_card,"Balance",0xFF64B5F6),
                    myItems(Icons.data_usage,"Expiry date",0xFF64B5F6),
                    
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(1, 250.0),
                    StaggeredTile.extent(1, 117.0),
                    StaggeredTile.extent(1, 117.0),
                  ],
                ),
              ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)),
              width: 400,
              margin: EdgeInsets.only(top: 15),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20.0),
            child: new SizedBox(
              height: 408,
                child: StaggeredGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 38.0),
                  children: <Widget>[
                    GestureDetector(
                      child: myItems(Icons.directions_bus,"Bus",0xFF64B5F6),
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Train()));
                      },
                    ),
                    GestureDetector(
                      child: myItems(Icons.directions_transit,"Train",0xFF64B5F6),
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Train()));
                      },
                    ),
                    GestureDetector(
                      child: myItems(Icons.touch_app,"Camera",0xFF64B5F6),
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Train()));
                      },
                    ),
                    GestureDetector(
                      child: myItems(Icons.settings,"Settings",0xFF64B5F6),
                      onTap: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Train()));
                      },
                    ),
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(1, 150.0),
                    StaggeredTile.extent(1, 150.0),
                    StaggeredTile.extent(1, 150.0),
                    StaggeredTile.extent(1, 150.0),
                  ],
                ),
            ),
            alignment: Alignment(0.0, 0.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
            ),
            ),
          ],
        ),
      )
    );
  }
  
}

