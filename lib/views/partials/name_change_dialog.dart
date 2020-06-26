
import 'package:flutter/material.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';

SimpleDialog nameChangeDialog (BuildContext context, String username) {
  var returner = (String value) => Navigator.pop(context, value);

  TextEditingController ctrl = TextEditingController (text: username);
  TextFormField usernameField = TextFormField (
    controller: ctrl,
  );

  return SimpleDialog (
    titlePadding: EdgeInsets.all(4),
    title: Text (WebshopLocalizations.of(context).changeName),
    children: <Widget>[
      usernameField,
      Row (
        children: <Widget>[
          RaisedButton (
              onPressed: () => returner(''),
              child: Text(WebshopLocalizations.of(context).cancel)
          ),
          RaisedButton (
              onPressed: () => returner(ctrl.value.text),
              child: Text(WebshopLocalizations.of(context).edit)
          ),
        ],
      )
    ],


  );
}