class UserModel {
  final String? email;
  final String? profilePic;
  final String? phone;
  final String? uid;
  final String? username;
  final String? dob;
  final bool? isRegistered;
  final String? password;
  final String? ntoken;

  UserModel(
      {this.email,
      this.profilePic,
      this.phone,
      this.uid,
      this.username,
      this.dob,
      this.isRegistered,
      this.password,
      this.ntoken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        profilePic: json['profilepic'],
        phone: json['phone'],
        uid: json['uid'],
        username: json['username'],
        dob: json['dob'],
        isRegistered: json['isRegistered'],
        password: json['password'],
        ntoken: json['ntoken']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'profilepic': profilePic,
      'phone': phone,
      'uid': uid,
      'username': username,
      'dob': dob,
      'isRegistered': isRegistered,
      'password': password,
      'ntoken': ntoken
    };
  }
}
