
import 'dart:async';

import 'package:havaswebshop/Repository/sql.dart';
import 'package:havaswebshop/enums/item_color.dart';
import 'package:havaswebshop/model/item.dart';
import 'package:havaswebshop/services/item_service.dart';
import 'package:sqflite/sqflite.dart';

/// CartItem: id, color, amount
class CartRepository extends Sql {
  
  CartRepository () :super();

  Future<List<CartItem>> getStored () async {
    return (await db).query(this.cartTable).then((list) =>
      list.map((e) => CartItem (
          DecoratedItem.formItem(
              ItemService.getItemFormId( e['id'] ),
              ItemColorFactory.colorFromText( e['color'] )
          ),
          e['amount']
        )
      ).toList()
    );
  }

  void addRow (CartItem item) async {
    (await db).insert(this.cartTable, item.toMap());
  }

  void modifyAmount (CartItem item) async {
    (await db).insert(
        this.cartTable,
        item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  void removeRow (CartItem item) async {
    (await db).delete(
        this.cartTable,
        where: 'id = ? AND category = ?',
        whereArgs: [item.item.id, item.item.category]
    );
  }

  void deleteAll () async {
    (await db).delete(this.cartTable);
  }
}
