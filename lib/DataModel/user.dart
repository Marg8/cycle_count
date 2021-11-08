class User {
  late int id;
  late String name;
  late String family;
  late String mobile;
  late String? email;
  late int type;
  late String? token;
  late bool active;
  late String? lastLogin;

  User(
      {required this.id,
      required this.name,
      required this.family,
      required this.mobile,
      this.email,
      required this.type,
      this.token,
      required this.active,
      this.lastLogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
    active = json['active'] == 1;
    lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['family'] = family;
    data['mobile'] = mobile;
    data['email'] = email;
    data['type'] = type;
    data['token'] = token;
    data['active'] = active ? 1 : 0;
    data['lastLogin'] = lastLogin;
    return data;
  }

  String get typeName => this.type == 1
      ? "Admin"
      : this.type == 2
          ? "Teacher"
          : "Student";
}
