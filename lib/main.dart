import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:havaswebshop/Repository/CartRepository.dart';
import 'package:havaswebshop/image-factory.dart';
import 'package:havaswebshop/l10n/MyLocaleDelegate.dart';
import 'package:havaswebshop/services/index.dart';

import 'package:havaswebshop/views/Browse.dart';
import 'package:havaswebshop/views/cart-page.dart';
import 'package:havaswebshop/views/home.dart';
import 'package:havaswebshop/views/orders.dart';
import 'package:havaswebshop/views/profile-page.dart';
import 'package:havaswebshop/views/suspect.dart';
import 'package:provider/provider.dart';

import 'Repository/profile_repository.dart';

CameraDescription _cameraDescription;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  _cameraDescription = firstCamera;

  CartRepository cartRepository = CartRepository();
  ProfileRepository profileRepository = ProfileRepository();

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (_) => CartService(cartRepository), ),
          ChangeNotifierProvider( create: (_) => UserService(profileRepository), ),
          Provider( create: (_) => ItemService(), ),
          Provider( create: (_) => OrderService(), ),
          Provider( create: (_) => CameraService(), ),
          Provider( create: (_) => ImageFactory(), ),
          Provider( create: (_) => WebshopLocalizationsDelegate(), ),
          Provider.value(value: firstCamera)
        ],
        child: Webshop()
      )
  );
}

class Webshop extends StatelessWidget {
  @override
  Widget build (BuildContext context ) {
    return MaterialApp (
      theme: ThemeData (
        primaryColor: Colors.deepPurpleAccent
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => Home(),
        'browse': (_) => Browse(),
        'browse/suspect': (_) => Suspect(), // Might be better via id
        'cart': (_) => CartPage(),
        'orders': (_) => Orders(),
//        'orders': (BuildContext ctx) => Orders(ctx),
        'profile': (_) => ProfilePage()
//        'profile': (_) => TakePictureScreen(camera: _cameraDescription)
      },
      localizationsDelegates: [
//        Provider.of<WebshopLocalizationsDelegate>(context),
        const WebshopLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('hu', ''),
      ],
    );
  }
}