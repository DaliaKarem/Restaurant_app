class User {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPass;
  String? userImg;

  User(
      {this.userId,
        this.userName,
        this.userEmail,
        this.userPass,
        this.userImg});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPass = json['user_pass'];
    userImg = json['user_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_pass'] = this.userPass;
    data['user_img'] = this.userImg;
    return data;
  }
}