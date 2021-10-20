class User {
  int _id = -1;
  String _name = "";
  String _password = "";

  User() {
    _id = -1;
    _name = "";
    _password = "";
  }

  User.fromMap(map) {
    this._id = map["id"];
    this._name = map["name"];
    this._password = map["password"];
  }

  int get id => _id;
  String get name => _name;
  String get password => _password;

  set id(int id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set password(String password) {
    this._password = password;
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["password"] = _password;
    return map;
  }
}
