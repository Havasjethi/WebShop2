
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:havaswebshop/Repository/CartRepository.dart';
import 'package:havaswebshop/model/item.dart';

class CartService with ChangeNotifier {

  /// The map has an AMOUNT and an ITEM property
  Map<String, CartItem> _items;
  final CartRepository _cartRepository;

  CartService( this._cartRepository ) {
    _items = Map<String, CartItem>();

    _cartRepository.getStored()
      .then((list) {
        list.forEach(
          (element) => this.add(element.item, amount: element.amount));
      }
    );
  }

  UnmodifiableListView<CartItem> get getItems => UnmodifiableListView(
      _items.keys.map((e) => _items[e])
  );

  int calculatePriceFormItems (List<CartItem> items) {
    int sum = 0;
    items.forEach((e) => sum += e.item.price * e.amount);
    return sum;
  }

  void add(DecoratedItem item, {int amount = 1}) {
    amount = amount > 0 ? amount : 1;

    String key = _keyFromDecoratedItem(item);

    if (_items.containsKey(key)) {
      _items[key].amount += amount;
    } else {
      _items[key] = CartItem(item, amount);
    }

    notifyListeners();
    _cartRepository.modifyAmount(_items[key]);
  }

  void remove(DecoratedItem item, {int amount = 1}) {
    amount = amount > 0 ? amount : 1;
    String key = _keyFromDecoratedItem(item);

    if (_items.containsKey(key) && _items[key].amount > amount) {
      _items[key].amount -= amount;
      _cartRepository.modifyAmount(_items[key]);
    } else {
      _items.remove(key);
      _cartRepository.removeRow(_items[key]);
    }

    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
    _cartRepository.deleteAll();
  }

  // If the item names are not unique it will cause problems
  String _keyFromDecoratedItem ( DecoratedItem item) {
    return "${item.category}_${item.name}";
  }
}

