import 'package:flutter/material.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';
import 'package:havaswebshop/views/partials/main-appbar.dart';

import '../button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: createMainAppbar(context),
      body: Container (
        width: double.infinity,
        child: Column (
          children: <Widget>[
            HomeButtons ()
          ],
        ),
      )
    );
  }
}

class HomeButtons extends StatelessWidget {
  List<Button> _getButtons (BuildContext ctx) {
    return <Button>[
      Button (WebshopLocalizations.of(ctx).browse, (_) => Navigator.pushNamed(ctx, 'browse')),
      Button (WebshopLocalizations.of(ctx).cart, (BuildContext ctx) => Navigator.pushNamed(ctx, 'cart')),
      Button (WebshopLocalizations.of(ctx).orders, (BuildContext ctx) => Navigator.pushNamed(ctx, 'orders')),
      Button (WebshopLocalizations.of(ctx).profile, (BuildContext ctx) => Navigator.pushNamed(ctx, 'profile')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        ...this._getButtons(context).map((e) => RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 30),
          onPressed: () => e.action(context),
          child: Text("${e.name}"),
//          color: Colors,
        ))
      ],
    );
  }
}
