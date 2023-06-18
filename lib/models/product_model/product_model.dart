import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String image;
  String id;
  String name;
  String price;
  String description;
  String status;
  bool isFavorite;
  int? qty;


  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.status,
    required this.isFavorite,
    this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json['image']??"",
        id: json['id'],
        name: json['name'],
        price: json['price'].toString(),
        description: json['description'],
        qty: json['qty'],
        status: json['status'],
        isFavorite: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
         "qty":qty,
        "description": description,
        "status": status,
        "isFavorite": isFavorite,
      };

  ProductModel copyWith({
    int? qty,
  }) {
    return ProductModel(
      image: image,
      id: id,
      name:name,
      price: price,
      description: description,
      qty: qty??this.qty,
      status:status,
      isFavorite: isFavorite,
    );
  }
}
