/// firstname : ""
/// lastname : ""
/// email : ""

class Login {
  Login({
    String? firstname,
    String? lastname,
    String? email,
  }) {
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
  }

  Login.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
  }
  String? _firstname;
  String? _lastname;
  String? _email;

  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['email'] = _email;
    return map;
  }
}
