// ignore_for_file: prefer_initializing_formals

import 'package:projeto_v2/model/user.dart';

abstract class UserEvent {}

class UpdateUser extends UserEvent {
  int id = -1;
  User user = User();

  UpdateUser(int id, User user) {
    this.id = id;
    this.user = user;
  }
}

class ScreenUser extends UserEvent {
  int id = -1;

  ScreenUser(int id) {
    this.id = id;
  }
}

class DeleteUser extends UserEvent {
  int userId = -1;

  DeleteUser(int userId) {
    this.userId = userId;
  }
}
