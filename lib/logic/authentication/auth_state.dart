abstract class AuthState {}

class Authenticated extends AuthState {
  String? username;
  int? id;

  Authenticated({this.id, this.username});
}

class Unauthenticated extends AuthState {}
