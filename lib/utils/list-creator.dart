
import 'package:flutter/material.dart';

List<Widget> listItemCreator<T> (
        List<T> listOfItems,
        Divider divider,
        Widget Function(T) creator) {

  List<Widget> widgets = [];

  if (listOfItems.length == 0) {
    return widgets;
  }

  widgets.add(creator(listOfItems.first));

  for (int i = 1; i < listOfItems.length; i++) {
    widgets.add(divider);
    widgets.add(creator(listOfItems[i]));
  }

  return widgets;
}

//        : ListView.builder(
//            itemCount: list.length,
//            itemBuilder: (BuildContext ctx, int index) {
//              return CartItemDisplay(list[index]);
//            }
//        );