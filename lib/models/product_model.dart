class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  int? categoryId;
  String? image;
  int? stock;
  double? rating;
  int? reviews;
  String? brand;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.categoryId,
    this.image,
    this.stock,
    this.rating,
    this.reviews,
    this.brand,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = (json['price'] as num?)?.toDouble();
    categoryId = json['categoryId'];
    image = json['image'];
    stock = json['stock'];
    rating = (json['rating'] as num?)?.toDouble();
    reviews = json['reviews'];
    brand = json['brand'];
  }
}