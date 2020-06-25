
import 'package:flutter/cupertino.dart';

class Button {
  String name;
  Function(BuildContext) action;

  Button ( this.name, this.action );
}