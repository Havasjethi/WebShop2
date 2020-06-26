import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class WebshopLocalizations {
  WebshopLocalizations(this.localeName);

  static Future<WebshopLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return WebshopLocalizations(localeName);
    });
  }

  static WebshopLocalizations of(BuildContext context) {
    return Localizations.of<WebshopLocalizations>(context, WebshopLocalizations);
  }

  final String localeName;

  String get webshop {
    return Intl.message(
      'webshop',
      name: 'webshop',
      desc: 'Appbar webshop',
      locale: localeName,
    );
  }
  String get browse {
    return Intl.message(
      'Browse',
      name: 'browse',
      desc: 'Homepage option',
      locale: localeName,
    );
  }
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: 'Homepage option',
      locale: localeName,
    );
  }
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Homepage option',
      locale: localeName,
    );
  }
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: 'Text for color',
      locale: localeName,
    );
  }

  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: 'Literally',
      locale: localeName,
    );
  }

  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: 'Order cart items',
      locale: localeName,
    );
  }

  String get suspect {
    return Intl.message(
      'Suspect',
      name: 'suspect',
      desc: 'Suspect item',
      locale: localeName,
    );
  }

  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: 'Price of an item',
      locale: localeName,
    );
  }

  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: 'Total',
      locale: localeName,
    );
  }

  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: 'Title of cart page',
      locale: localeName,
    );
  }

  String get cancel  {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel a dialog',
      locale: localeName,
    );
  }

  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: 'Ok Dialog',
      locale: localeName,
    );
  }

  String get finishOrderInfo  {
    return Intl.message(
      'Are you sure you want to place your order?',
      name: 'finishOrderInfo',
      desc: 'Bla bla',
      locale: localeName,
    );
  }

  String get changeName {
    return Intl.message(
      'Change name',
      name: 'changeName',
      desc: 'Name change dialog title',
      locale: localeName,
    );
  }

  String get edit  {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: 'name change dialog',
      locale: localeName,
    );
  }
}
