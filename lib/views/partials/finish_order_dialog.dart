
import 'package:flutter/material.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';

SimpleDialog finishOrderDialog( BuildContext context ) {
  var returner = (bool value) => Navigator.pop(context, value);
  WebshopLocalizations texts = WebshopLocalizations.of(context);

  return SimpleDialog (
    title: Text(texts.finishOrderInfo),
    titlePadding: EdgeInsets.all(3),
    children: <Widget>[
      Text (texts.finishOrderInfo),
      Row (
        children: <Widget>[
          RaisedButton (
            onPressed: () => returner(false),
            child: Text(texts.cancel)
          ),
          RaisedButton (
            onPressed: () => returner(true),
            child: Text(texts.ok)
          ),
        ],
      )
    ],
  );
}