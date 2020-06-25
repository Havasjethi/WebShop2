
import 'package:havaswebshop/enums/category.dart';
import 'package:havaswebshop/enums/item_color.dart';

class Item {
  int id;
  String name;
  int price;
  Category category;

//  static int _nextID () {
//
//  }


  // Item (this.name, this.price, this.category, this.color) { }
  Item (this.id, this.name, this.price, this.category,);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'category': this.category,
    };
  }
}

class DecoratedItem extends Item {
  ItemColor color;
  DecoratedItem(int id, String name, int price, Category category, this.color) : super(id, name, price, category);
  DecoratedItem.formItem (Item item, this.color) : super(item.id, item.name, item.price, item.category);

  bool equals(DecoratedItem other) {
    return this.id == other.id && this.color == other.color;
  }

  Map<String, dynamic> toMap() {
    var base = super.toMap();
    base['color'] = this.color;
    return base;
  }
}

class CartItem {
  DecoratedItem item;
  int amount;

  CartItem ( this.item, this.amount);

  Map<String, dynamic> toMap () {
    return {
      'id': item.id,
      'color': ItemColorFactory.textFormColor(this.item.color),
      'amount': amount,
    };
  }
}