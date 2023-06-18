
import 'package:tech_stacks_admin_pannel/models/product_model/product_model.dart';

class OrderModel {
  String payment;
  String status;
  List<ProductModel> product;
  double totalPrice;
  String orderId;


  OrderModel({
    required this.payment,
    required this.status,
    required this.product,
    required this.totalPrice,
    required this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json){
    List<dynamic> productMap=json['products'];
    return OrderModel(
      orderId: json['orderId'],
      product: productMap.map((e) => ProductModel.fromJson(e)).toList(),
      totalPrice: json['totalPrice'],
      status: json['status'],
      payment: json['payment'],
    );
  }



}