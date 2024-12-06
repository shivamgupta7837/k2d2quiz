import 'package:flutter/cupertino.dart';
import 'package:quiz/model/user_model.dart';

class AddUserProvider extends ChangeNotifier{
  static List<UserModel> users = [];
  void addUser(UserModel user){
    users.add(user);
  }
}