
import 'package:havaswebshop/model/address.dart';

class User {
  int id;
  String username;
  Address address;

  User ( this.id, this.username, {Address address} ) {
    this.address = address;
  }
}