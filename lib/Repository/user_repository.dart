import '../DataModel/user.dart';

class UserRepo {
  static Future<User> authenticate(String mobile, String pass) async {
    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (mobile == "2" && pass == "1") {
        Map<String, dynamic> _res = {"id":1, "name":"Mario","family":"TSP","mobile":"8689032956","type":1,"active":1};
        
        return User.fromJson(_res);
      }
      throw Exception("mobile/password was wrong");
    });
  }
}
