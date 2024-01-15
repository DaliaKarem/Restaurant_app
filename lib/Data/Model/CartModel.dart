class CartModel {
  String? sId;
  User? user;
  String? rest;
  NameProduct? nameProduct;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartModel(
      {this.sId,
        this.user,
        this.rest,
        this.nameProduct,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rest = json['Rest'];
    nameProduct = json['nameProduct'] != null
        ? new NameProduct.fromJson(json['nameProduct'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['Rest'] = this.rest;
    if (this.nameProduct != null) {
      data['nameProduct'] = this.nameProduct!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;

  User({this.sId, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}

class NameProduct {
  int? ratings;
  String? sId;
  String? name;
  String? desc;
  int? price;
  String? img;
  Category? category;

  NameProduct(
      {this.ratings,
        this.sId,
        this.name,
        this.desc,
        this.price,
        this.img,
        this.category});

  NameProduct.fromJson(Map<String, dynamic> json) {
    ratings = json['ratings'];
    sId = json['_id'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    img = json['img'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratings'] = this.ratings;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['img'] = this.img;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  String? sId;
  String? name;

  Category({this.sId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}