import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/data/local/local_database.dart';
import 'package:projeto_v2/logic/authentication/auth_event.dart';
import 'package:projeto_v2/logic/authentication/auth_state.dart';
import 'package:projeto_v2/model/user.dart';
import 'package:projeto_v2/screens/login_screen.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginUser) {
      List<User> list = await DatabaseLocalServer.helper.getUserList();
      for (int i = 0; i < list.length; i++) {
        User user2 = list[i];
        user = user2;
        if (user2.name == event.username && user2.password == event.password) {
          yield Authenticated(id: user2.id, username: event.username);
        }
      }
    } else {
      yield Unauthenticated();
    }
  }
}
