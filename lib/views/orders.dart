

import 'package:flutter/material.dart';
import 'package:havaswebshop/model/order.dart';
import 'package:havaswebshop/services/order_service.dart';
import 'package:provider/provider.dart';

class Orders extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text ("Orders"),
      ),
      body: Column (
        children: <Widget>[
          Text ("Under construction.."),
//          Consumer<OrderService>(
//            builder: (ctx, service, child) {
//              List<Order> orders = service.getOrders;
//              return orders.length == 0
//                  ? Text("You do not have any orders.. yet")
//                  : ListView (
//                      children: <Widget>[
//                        ...orders.map((Order order) => ListTile(
//                          onTap: () => print('Push Order to page'),
//                          title: Text("${order.time}"),
//                          )
//                        )
//                      ],
//              );
//            }
//          )
        ],
      ),
    );
  }
}