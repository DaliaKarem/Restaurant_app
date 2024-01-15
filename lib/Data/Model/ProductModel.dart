class productModel {
  String? sId;
  String? user;
  String? name;
  String? desc;
  int? price;
  num? ratings;
  String? img;
  Category? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  productModel(
      {this.sId,
        this.user,
        this.name,
        this.desc,
        this.price,
        this.ratings,
        this.img,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.iV});

  productModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    desc = json['desc'];
    price = json['price'];
    ratings = json['ratings'];
    img = json['img'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['ratings'] = this.ratings;
    data['img'] = this.img;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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