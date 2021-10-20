import 'package:projeto_v2/model/user.dart';

abstract class UserState {}

class Screen extends UserState {
  User user = User();

  Screen(User user) {
    this.user = user;
  }
}
