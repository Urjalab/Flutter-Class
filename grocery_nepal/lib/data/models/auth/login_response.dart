class LoginResponse {
  int? id;
  String? email;
  String? name;
  String? token;

  LoginResponse({this.id, this.email, this.name, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.email = json["email"];
    this.name = json["name"];
    this.token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["name"] = this.name;
    data["token"] = this.token;
    return data;
  }
}
