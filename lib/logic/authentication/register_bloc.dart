import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_v2/data/local/local_database.dart';
import 'package:projeto_v2/logic/authentication/register_event.dart';
import 'package:projeto_v2/logic/authentication/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(Normal());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is Register) {
      DatabaseLocalServer.helper.insertUser(event.user);
      yield Correct();
    } else {
      yield Incorrect();
    }
  }
}
