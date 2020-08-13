class User {
  String name;
  String email;
  String phone;
  String id;

  User({this.name, this.email, this.phone, this.id});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      phone: data["contact"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "contact": phone};
  }
}
