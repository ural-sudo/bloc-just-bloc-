import 'dart:io';
import 'package:bloc_without_cubit/view/User/model/user.dart';
import 'package:dio/dio.dart';

/* enum UserUrl { user1, user2 }

const user1Url =
    "C:/Users/Piton/Desktop/bloc_without_cubit/bloc_without_cubit/api/user1.json";
const user2Url =
    "C:/Users/Piton/Desktop/bloc_without_cubit/bloc_without_cubit/api/user2.json";

extension UrlExtension on UserUrl {
  String get convertUrlToString {
    switch (this) {
      case UserUrl.user1:
        return user1Url;
      case UserUrl.user2:
        return user2Url;
    }
  }
} */

abstract class IUserService {
  IUserService(this.dio);
  final Dio dio;

  Future<User?> getUsers();
}

class UserService extends IUserService {
  UserService(Dio dio) : super(dio);

  @override
  Future<User?> getUsers() async {
    try {
      final response = await dio.get("https://reqres.in/api/users?page=2");
      if (response.statusCode == HttpStatus.ok) {
        final jsonData = response.data;
        if (jsonData is Map<String,dynamic>) {
          //print(jsonData);
          return User.fromJson(jsonData);
        }
      }
      return null;
      
    } catch (e) {
      print(e);
    }
  }
}
