
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:havaswebshop/services/index.dart';
import 'package:havaswebshop/views/image_controller.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  File image;

  @override
  Widget build(BuildContext context) {
    String imagePath = Provider.of<UserService>(context).getImagePath;
    return Scaffold (
      appBar: AppBar (
        title: Text("Profile page"),
      ),
      body: Column (
        children: <Widget>[
          Container (
  //          width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(150),
            ),
  //          child: Image.asset('assets/profile_picture_placeholder.png'),
            child: Stack (
              children: <Widget>[
                Consumer<UserService>(
                  builder: (ctx, service, child) {
                    imagePath = service.getImagePath;
                    return CircleAvatar (
                      radius: 80,
                        backgroundImage: imagePath != '' && imagePath != null
                          ? Image.file(File(imagePath)).image
                          : Image.asset('assets/profile_picture_placeholder.png').image,
                    );
                  }
                ),
                GestureDetector (
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TakePictureScreen(camera: Provider.of<CameraDescription>(context),)
                    )).then((path) {
                      if (path != '') {
                        Provider.of<UserService>(context).setProfileImagePath(path);
                      }
                    });
                  },
                  child: Icon(Icons.camera),
                ),
                Positioned (
                  top: 0,
                  right: 0,
                  child: GestureDetector (
                    onTap: () => Provider.of<UserService>(context).clearProfileImage(),
                    child: Icon (Icons.delete),
                  ),
                )
              ],
            )
          ),
          Consumer<UserService>(
            builder: (context, service, child) {
              print(service.getUser);
              return Text('asd');
          },
          ),
        ],
      )
    );
  }

}