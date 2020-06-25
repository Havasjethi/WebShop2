

import 'package:flutter/material.dart';
import 'package:havaswebshop/l10n/MyLocale.dart';
//import 'package:havaswebshop/localization/MyLocale.dart';

class WebshopLocalizationsDelegate extends LocalizationsDelegate<WebshopLocalizations> {
//  String currentLocale;

//  WebshopLocalizationsDelegate() {
//    currentLocale = 'null';
//  }

  const WebshopLocalizationsDelegate();
//{
//    currentLocale = 'null';

  @override
  bool isSupported(Locale locale) => ['en', 'hu'].contains(locale.languageCode);

  @override
  Future<WebshopLocalizations> load(Locale locale) =>
    WebshopLocalizations.load(locale)
//        .whenComplete(() => currentLocale = locale.languageCode);
;

  @override
  bool shouldReload(WebshopLocalizationsDelegate old) =>  false; //currentLocale != old.currentLocale;
}