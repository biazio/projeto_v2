// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/data/local/local_database.dart';
import 'package:projeto_v2/logic/authentication/user_event.dart';
import 'package:projeto_v2/logic/authentication/user_state.dart';
import 'package:projeto_v2/model/user.dart';
import 'package:projeto_v2/screens/login_screen.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(Screen(user));

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UpdateUser) {
      await DatabaseLocalServer.helper.updateUser(event.id, event.user);
      yield Screen(user);
    } else if (event is ScreenUser) {
      List<User> list = await DatabaseLocalServer.helper.getUserList();
      var user;

      for (int i = 0; i < list.length; i++) {
        if (list[i].id == event.id) {
          user = list[i];
          break;
        }
      }

      yield Screen(user);
    } else if (event is DeleteUser) {
      await DatabaseLocalServer.helper.deleteUser(event.userId);
      yield Screen(user);
    }

    yield Screen(user);
  }
}
