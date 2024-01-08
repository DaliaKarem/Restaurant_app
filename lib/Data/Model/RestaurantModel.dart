class RestaurantModel {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? role;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? img;
  num? rateRes;

  RestaurantModel(
      {this.sId,
        this.name,
        this.email,
        this.password,
        this.role,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.img,
        this.rateRes});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    img = json['img'];
    rateRes = json['rateRes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['img'] = this.img;
    data['rateRes'] = this.rateRes;
    return data;
  }
}