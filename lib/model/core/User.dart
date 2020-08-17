import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.success,
    this.user,
  });

  String success;
  UserClass user;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
      };
}

class UserClass {
  String name;
  String email;
  String phone;
  int id;

  UserClass({this.name, this.email, this.phone, this.id});
  factory UserClass.fromJson(Map<String, dynamic> data) {
    return UserClass(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      phone: data["mobile"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "contact": phone};
  }
}
