
import 'package:flutter/material.dart';

SimpleDialog nameChangeDialog (BuildContext context, String username) {
  var returner = (String value) => Navigator.pop(context, value);

  TextEditingController ctrl = TextEditingController (text: username);
  TextFormField usernameField = TextFormField (
    controller: ctrl,
  );

  return SimpleDialog (
    titlePadding: EdgeInsets.all(4),
    title: Text ("Change name"),
    children: <Widget>[
      usernameField,
      Row (
        children: <Widget>[
          RaisedButton (
              onPressed: () => returner(''),
              child: Text("Cancel")
          ),
          RaisedButton (
              onPressed: () => returner(ctrl.value.text),
              child: Text("Edit")
          ),
        ],
      )
    ],


  );
}