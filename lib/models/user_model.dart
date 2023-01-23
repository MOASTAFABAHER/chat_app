class UserModel {
  String? email;
  String? password;
  String? uId;
  UserModel({this.email, this.password, this.uId});
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'uId': uId};
  }
}
