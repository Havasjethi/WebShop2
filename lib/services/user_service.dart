
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
        print("Go user from database $rawData");
        this._user = User (rawData['id'], rawData['username']);
        print("this._user: ${this._user}");
      }).catchError((e) {
        this._user = User (1, 'Anonym');
      });

    _profileRepository.getUserImagePath()
        .then((path) => this._userImagePath = path);
  }

  User get getUser => _user;
  String get getImagePath => _userImagePath;

  void setUsername (String username) {
    _user.username = username;
    _profileRepository.setUsername(username, _user.id);
    notifyListeners();
  }

  User setUser (User user){
    _user = user;
    notifyListeners();
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