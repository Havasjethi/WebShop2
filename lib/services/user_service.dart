
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:havaswebshop/Repository/profile_repository.dart';
import 'package:havaswebshop/model/user.dart';

class UserService with ChangeNotifier {

  User _user;
  ProfileRepository _profileRepository;
  String _userImagePath;

  UserService( this._profileRepository ){
    _userImagePath = '';

    _profileRepository.getRawUserData()
      .then((rawData) {
        print("Meh");
        this._user = User (rawData['id'], rawData['username']);
        print("this._user: ${this._user}");
      }).catchError(() {
        print('Gecu bagy ads');
        throw Error;
      })
        .whenComplete(() => print("this is happened"));
    ;

    _profileRepository.getUserImagePath()
        .then((path) => this._userImagePath = path);
  }

  User get getUser => _user;
  String get getImagePath => _userImagePath;

  User setUser (User user){
    _user = user;
    return _user;
  }

  void setProfileImagePath (String path) {
    _profileRepository.setProfileImagePath(path);
    _userImagePath = path;
    notifyListeners();
  }

  void clearProfileImage () {
    _profileRepository.clearProfileImage();
    _userImagePath = '';
    notifyListeners();
  }
}