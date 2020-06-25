
import 'dart:collection';

import 'package:havaswebshop/enums/category.dart';

import '../model/item.dart';

List<Item> mockItems = [
  Item (1, 'Fullos Kabát', 10000, Category.jacket),
  Item (2, 'Lame  Socks', 300, Category.socks),
  Item (3, 'Some Shirt', 2400, Category.shirt),
  Item (4, 'Fancy shoes', 8000, Category.shoe),
  Item (5, 'Pullower', 5000, Category.pullover),
  Item (6, 'Cool Skirt', 4300, Category.skirt),
  Item (7, 'Another Short', 1600, Category.shirt),
];

class ItemService {
  List<Item> _items;

  ItemService ( ) {
    _items = [...mockItems];
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView<Item>(_items);

  add (Item item) {
    _items.add(item);
  }

  static Item getItemFormId (int id) {
    return mockItems.firstWhere((e) => e.id == id);
  }
}

