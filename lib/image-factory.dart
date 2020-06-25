
import 'package:flutter/material.dart';
import 'package:havaswebshop/enums/category.dart';

class ImageFactory {

  AssetImage fromCategory (Category category ) {
    return ImageFactory.getImage(category);
  }

  static AssetImage getImage (Category category) {

    switch (category){
      case Category.shirt:
        return AssetImage('assets/items/shirt.jpeg');
      case Category.pullover:
        return AssetImage('assets/items/pullover.png');
      case Category.socks:
        return AssetImage('assets/items/socks.png');
      case Category.shoe:
        return AssetImage('assets/items/shoes.png');
      case Category.skirt:
        return AssetImage('assets/items/skirt.jpg');
      case Category.jacket:
        return AssetImage('assets/items/jacket.jpeg');
      default:
        return AssetImage('assets/items/question_marks.jpg');
    }
  }
}