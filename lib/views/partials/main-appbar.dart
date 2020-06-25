

import 'package:flutter/material.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';

//class MainAppBar extends AppBar {
//
//  MainAppBar();
//
//  @override
//  Widget build(BuildContext context) {
//    return AppBar (
//      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.shopping_cart),
//          onPressed: () => Navigator.pushNamed(context, 'cart'),
//        )
//      ],
//      title: Row (
//        children: <Widget>[
//          Icon ( IconData(0xeb3b, fontFamily: 'MaterialIcons'), color: Colors.yellowAccent),
//          Text ( "Havas " + WebshopLocalizations.of(context).webshop ),
//        ],
//      ),
//    );
//  }
//
//}

AppBar createMainAppbar (BuildContext context) {
  return AppBar (
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () => Navigator.pushNamed(context, 'cart'),
      )
    ],
    title: Row (
      children: <Widget>[
        Icon ( IconData(0xeb3b, fontFamily: 'MaterialIcons'), color: Colors.yellowAccent),
        Text ( "Havas " + WebshopLocalizations.of(context).webshop ),
      ],
    ),
  );
}

