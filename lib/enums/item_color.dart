enum ItemColor {
  red,
  purple,
  blue,
  pink,
  green,
  yellow,
  black,
  white,
}

class ItemColorFactory {

  static String textFormColor (ItemColor color) {
    switch (color){
      case ItemColor.red:
        return 'red';
      case ItemColor.purple:
        return 'purple';
      case ItemColor.blue:
        return 'blue';
      case ItemColor.pink:
        return 'pink';
      case ItemColor.green:
        return 'green';
      case ItemColor.yellow:
        return 'yellow';
      case ItemColor.black:
        return 'black';
      case ItemColor.white:
        return 'white';
      default:
        throw Error ();
    }
  }

  static ItemColor colorFromText (final String color) {
    switch(color) {
      case 'red':
        return ItemColor.red;
      case 'purple':
        return ItemColor.purple;
      case 'blue':
        return ItemColor.blue;
      case 'pink':
        return ItemColor.pink;
      case 'green':
        return ItemColor.green;
      case 'yellow':
        return ItemColor.yellow;
      case 'black':
        return ItemColor.black;
      case 'white':
        return ItemColor.white;
      default:
        throw Error();
    }
  }
}