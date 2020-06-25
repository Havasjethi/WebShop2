
import 'package:flutter/material.dart';

SimpleDialog finishOrderDialog( BuildContext context ) {
  var returner = (bool value) => Navigator.pop(context, value);

  return SimpleDialog (
    title: Text("Finish order"),
    titlePadding: EdgeInsets.all(3),
    children: <Widget>[
      Text ("Are you sure you want to place your order?"),
      Row (
        children: <Widget>[
          RaisedButton (
            onPressed: () => returner(false),
            child: Text("Nope")
          ),
          RaisedButton (
            onPressed: () => returner(true),
            child: Text("Hell yeah")
          ),
        ],
      )
    ],
  );
}