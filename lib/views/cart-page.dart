

import 'package:flutter/material.dart';
import 'package:havaswebshop/image-factory.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';
import 'package:havaswebshop/services/cart_service.dart';
import 'package:havaswebshop/model/item.dart';
import 'package:havaswebshop/services/order_service.dart';
import 'package:havaswebshop/services/user_service.dart';
import 'package:havaswebshop/utils/list-creator.dart';
import 'package:havaswebshop/views/partials/finish_order_dialog.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {

  Widget _createList (BuildContext ctx, CartService service, Widget children) {
    var list = service.getItems;

    return (list.length == 0)
    ? Column (
        children: <Widget>[
          Text ("No items found in your cart"),
          RaisedButton (
            child: Text ("Browse items"),
            onPressed: () => Navigator.popAndPushNamed(ctx, 'browse'),
          )
        ],
      )
    : ListView (
        padding: EdgeInsets.only(left: 3.2),
        children: listItemCreator(
            service.getItems,
            Divider(),
            (CartItem item) => CartItemDisplay(item)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold (
      appBar: AppBar (
        title: Text(WebshopLocalizations.of(context).cart)
      ),

      persistentFooterButtons: Provider.of<CartService>(context).getItems.length == 0 ? [] : <Widget>[
        Text("${WebshopLocalizations.of(context).total}:"),
        Consumer<CartService>(builder: (context, service, child) {
          int total = service.calculatePriceFormItems(service.getItems);
          return Text("$total");
        }),
        RaisedButton (
          onPressed: () async {
            showDialog<bool>(
              context: context,
              child: finishOrderDialog(context)
            ).then((result) {
              if (result) {
                var service = Provider.of<CartService>(context);
                List<CartItem> items = service.getItems;
                Provider.of<OrderService>(context).placeOrder(
                  Provider.of<UserService>(context).getUser,
                  items
                );
                service.clear();
              }
            });
          },
          child: Text("Palce order"),
        )
      ],
      body: Container (
        width: double.infinity,
        child: Column (
        children: <Widget>[
          Expanded (
            child: Consumer<CartService>(builder: (context, service, child) =>_createList(context, service, child)),
          ),
          ]
        )
      )
    );
  }
}

class CartItemDisplay extends StatelessWidget {
  CartItem _item;
  CartItemDisplay( this._item );

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;

    return Row (
      children: <Widget>[
        Image (
          width: phoneWidth * .25,
          height: phoneWidth * .25,
          image: Provider.of<ImageFactory>(context).fromCategory(_item.item.category),
        ),
        Text('${_item.item.name}'),
        _AmountHandler (_item),
        Container (
          alignment: Alignment.centerRight,
            child: Column (
              children: <Widget>[
                Text(
                    "${WebshopLocalizations.of(context).total}: ${_item.amount * _item.item.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text("Each: ${_item.item.price}")
              ],
            )
        )
      ],
    );
  }
}

class _AmountHandler extends StatefulWidget {
  CartItem item;
  _AmountHandler ( this.item );

  @override
  _AmountHandlerState createState() => _AmountHandlerState( item );
}

class _AmountHandlerState extends State<_AmountHandler> {
  CartItem item;
  _AmountHandlerState ( this.item );

  @override
  Widget build(BuildContext context) {
    CartService service = Provider.of<CartService>(context);
    return Container (
      child: Row (
        children: <Widget>[
          Column (
            children: <Widget>[
              CircleButton(Icons.add, () => service.add(item.item)),
              CircleButton(Icons.remove, () => service.remove(item.item)),
            ],
          ),
          Text ('${item.amount}'),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  Function callback;
  IconData icon;

  CircleButton ( this.icon, this.callback );

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
//      visualDensity: VisualDensity(horizontal: .001),
      constraints: BoxConstraints.tightFor(
        width: 25,
        height: 25
      ),
      onPressed: () => callback(),
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15.0,
      ),
      padding: EdgeInsets.all(1.0),
      shape: CircleBorder(),
    );
  }
}

