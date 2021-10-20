import 'package:projeto_v2/model/user.dart';

abstract class RegisterEvent {}

class Register extends RegisterEvent {
  User? user;

  Register({this.user});
}

class ChangeOnDropDownMenu extends RegisterEvent {}
