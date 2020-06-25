
import 'package:flutter/material.dart';
import 'package:havaswebshop/image-factory.dart';
import 'package:havaswebshop/model/item.dart';
import 'package:havaswebshop/services/item_service.dart';
import 'package:havaswebshop/utils/list-creator.dart';
import 'package:havaswebshop/views/partials/main-appbar.dart';
import 'package:provider/provider.dart';

class Browse extends StatefulWidget {
  @override
  BrowseState createState() => BrowseState ();
}

class BrowseState extends State<Browse> {
  List<Item> _items;
  double screenWidth;

//  BrowseState ();

  ListView _createList(BuildContext ctx) {
    print("Created");
    List<Item> items = Provider.of<ItemService>(ctx).items;

    Divider divider = Divider(
      color: Colors.red,
      height: 3,
      thickness: 1.2,
    );

    return ListView(
      padding: EdgeInsets.all(5),
      children: listItemCreator(
        items, divider, (Item item) => _createTile(item)
      ),
    );
  }

  ListTile _createTile (Item item) {
    return ListTile(
      leading: Image(
        height: screenWidth * .2,
        width: screenWidth * .2,
        image: ImageFactory.getImage(item.category),
      ),
      title: Text(item.name),
      trailing: GestureDetector (
        onTap: () => Navigator.pushNamed(context, 'browse/suspect', arguments: item),
        child: Icon ( Icons.remove_red_eye, color: Colors.black26, ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold (
      appBar: createMainAppbar(context),
      body: Center (
        child: _createList(context),
      )
    );
  }
}