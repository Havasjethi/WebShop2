
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:havaswebshop/enums/item_color.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';
import 'package:havaswebshop/services/cart_service.dart';
import 'package:havaswebshop/model/item.dart';
import 'package:provider/provider.dart';

import '../image-factory.dart';

class Suspect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    Item item = ModalRoute.of(context).settings.arguments;
    final Item item = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size.width * .65;

    return Scaffold (
      appBar: AppBar(
        title: Text("asd"),
      ),
      body: Container (
        child: Column (
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Container (
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 1)
                  ),
                  child: Image(
                    width: size,
                    height: size,
                    image: Provider.of<ImageFactory>(context).fromCategory(item.category),
                  )
              ),
            ),
            Container (
              padding: EdgeInsets.all(6),
              color: const Color(0xFFAABBFF),
              alignment: Alignment.centerLeft,
              child: Text("${item.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  )),
            ),
            Container (
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 20, right: 35),
              child: Text(
                "${WebshopLocalizations.of(context).price}: \$${item.price}",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(0x44, 0x44, 0x44, 1),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container (
              alignment: Alignment.bottomRight,
              child: AddItemToCart(item),
            )
          ],
        ),
      ),
    );
  }
}

class AddItemToCart extends StatelessWidget {
  final Item _item;
  AddItemToCart ( this._item );

  @override
  Widget build(BuildContext context) {
    return FlatButton (
      onPressed: () => Provider.of<CartService>(context).add(DecoratedItem.formItem(_item, ItemColor.yellow)),
      child: Row(
        children: <Widget>[
          Icon(Icons.shopping_cart),
          Text("${WebshopLocalizations.of(context).addToCart}")
        ],
      ),
    );
  }

}