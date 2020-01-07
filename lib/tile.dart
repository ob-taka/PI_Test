import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Material myItems(IconData icon, String heading, int color){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(      
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(heading, style: TextStyle(
                    color: new Color(color),
                    fontSize: 20.0,
                  ),),
                  ),

                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(icon, 
                      color: Colors.white,
                      size: 30.0,
                      ), 
                    ),
                  ),
                  
                ],
              )
            ],
          ),
        ),
        ),
    );
  }