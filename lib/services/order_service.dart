
import 'dart:collection';

import 'package:havaswebshop/model/item.dart';
import 'package:havaswebshop/model/order.dart';
import 'package:havaswebshop/model/user.dart';

class OrderService {

  List<Order> _orders;
  OrderService(){
    _orders = List<Order>();
  } // Todo :: Add OrderRepository

  UnmodifiableListView<Order> get getOrders => UnmodifiableListView(_orders);

  placeOrder (User user, List<CartItem> items) {

    _orders.add(Order (
      user,
      items,
      DateTime.now()
    ));
  }
}
