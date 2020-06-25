
import 'package:havaswebshop/model/item.dart';
import 'package:havaswebshop/model/user.dart';

class Order {

  User user;
  List<CartItem> items;
  DateTime time;

  Order (this.user, this.items, this.time);
}