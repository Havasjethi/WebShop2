


import 'package:havaswebshop/Repository/sql.dart';

class ProfileRepository extends Sql {

  ProfileRepository () :super();

  updateUserInfo () async {

  }

  Future<Map<String, dynamic>> getRawUserData () async {
    return (await db).query(profileTable, where: 'id = 1')
        .then((value) => value.first);
  }

  Future<String> getUserImagePath () async {
    (await db).query(
      profileTable,
      where: "id = 1",
      columns: [ 'profile_image_path' ]
    ).then((value) {
      print("I got this: $value");
      return value ?? '';
    });
  }

  void setProfileImagePath (String path) async {
    print("I wanna save this: $path");
    (await db).rawUpdate(
      '''
        Update $profileTable
        SET profile_image_path = ?
        WHERE id = ?;
      ''',
      [ path, 1 ]
    );
  }

  void clearProfileImage () async {
    (await db).rawUpdate(
        '''
        Update $profileTable
        SET profile_image_path = null,
        WHERE id = 1;
      ''',
    );
  }

}